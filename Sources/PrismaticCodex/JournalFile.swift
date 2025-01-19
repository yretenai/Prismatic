// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// A protocol to act as a delegate for handling new events.
public protocol JournalHandler {
	func handleEntry(event: JournalEntry)
}

/// Monitors a specific journal file.
public class JournalFile {
	init?(filePath path: URL, delegate: JournalHandler) {
		guard let handle = try? FileHandle(forReadingFrom: path) else {
			return nil
		}

		self.handle = handle
		self.delegate = delegate
		isStream = path.lastPathComponent.starts(with: "Journal")
		isComplete = false

		update()
	}

	public func update() {
		guard isStream else {
			updateFully()
			return
		}
		updateStream()
		return
	}

	private func updateStream() {
		do {
			var offset = try handle.offset()
			guard let data = try handle.readToEnd() else {
				return
			}

			for entry in data.split(separator: 0xA) {
				if entry.count > 50 {
					// minimum size is 50 bytes
					guard update(data: entry) else {
						// rollback
						try handle.seek(toOffset: offset)
						return
					}
				}

				// advance offset
				offset += UInt64(entry.count) + 1
			}
		} catch {
			return
		}
	}

	private func updateFully() {
		do {
			try handle.seek(toOffset: 0)

			guard let data = try handle.readToEnd() else {
				return
			}

			_ = update(data: data)
		} catch {
			return
		}
	}

	private func update(data rawData: Data) -> Bool {
		var data = rawData
		if data.last == 0xD {
			data = data[...data.index(data.count, offsetBy: -1)]
		}

		guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
			return false
		}

		guard let journal = JournalEntry.load(json: json) else {
			return false
		}

		delegate.handleEntry(event: journal)

		if isStream && journal.event == .shutdown || journal.event == .continued {
			isComplete = true
			try? handle.close()
		}

		return true
	}

	private let handle: FileHandle
	public let isStream: Bool
	public var isComplete: Bool
	private let delegate: JournalHandler
}
