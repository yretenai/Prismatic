// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Monitors a specific journal file.
public final class JournalFile {
	init?(filePath path: URL, delegate: @escaping (JournalEntry) -> Void) {
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

	private func update(data: Data) -> Bool {
		guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
			return false
		}

		guard let journal = JournalEntry.load(json: json) else {
			return false
		}

		delegate(journal)

		if isStream && journal.event == .shutdown || journal.event == .continued {
			isComplete = true
			try? handle.close()
		}

		return true
	}

	private let handle: FileHandle
	public let isStream: Bool
	public var isComplete: Bool
	private let delegate: (JournalEntry) -> Void
}
