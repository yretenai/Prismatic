// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import FileMonitor
import Foundation

/// Monitors journal files and continiously polls for new events.
public final class JournalStream: FileDidChangeDelegate {
	/// The most recent journal version implemented.
	public static let journalVersion = 37

	public init?(saveDataPath path: URL, delegate: @escaping (JournalEntry) -> Void) {
		self.saveLocation = path.absoluteURL
		self.delegate = delegate
		monitoredFiles = [:]
		self.monitor = nil
		self.monitor = try? FileMonitor(directory: saveLocation, delegate: self)

		if let files = try? FileManager.default.contentsOfDirectory(
			at: saveLocation, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles, .skipsPackageDescendants, .skipsSubdirectoryDescendants])
		{
			// handle log files
			for file in files {
				guard file.pathExtension == "log" else {
					continue
				}

				update(path: file)
			}

			// then handle jsons
			for file in files {
				guard file.pathExtension == "json" else {
					continue
				}

				update(path: file)
			}
		}
	}

	private let saveLocation: URL
	private let delegate: (JournalEntry) -> Void
	private var monitoredFiles: [String: JournalFile]
	private var monitor: FileMonitor?

	private func update(path: URL) {
		guard path.pathExtension == "json" || path.pathExtension == "log" else {
			return
		}

		let component = path.lastPathComponent
		let key = String(component[...component.index(component.endIndex, offsetBy: -4)])
		if let file = monitoredFiles[key] {
			file.update()

			if file.isComplete {
				monitoredFiles.removeValue(forKey: key)
			}
		} else {
			guard let file = JournalFile(filePath: path, delegate: delegate) else {
				return
			}

			if !file.isComplete {
				monitoredFiles[key] = file
			}
		}
	}

	public func fileDidChanged(event: FileChange) {
		switch event {
			case .added(let file):
				update(path: file)
			case .changed(let file):
				update(path: file)
			default:
				return
		}
	}

	public func start() {
		try? monitor?.start()
	}

	public func stop() {
		monitor?.stop()
	}
}
