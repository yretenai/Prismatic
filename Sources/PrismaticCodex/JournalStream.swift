// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import FileMonitor
import Foundation

/// Monitors journal files and continiously polls for new events.
public final class JournalStream: FileDidChangeDelegate {
	/// The most recent journal version implemented.
	///
	/// ref: https://hosting.zaonce.net/community/journal/v37/Journal_Manual_v37.pdf
	/// ref: https://elite-journal.readthedocs.io/en/latest/
	/// ref: https://forums.frontier.co.uk/threads/journal-docs-for-odyssey-release.575010
	public static let journalVersion = 37

	public init?(saveDataPath path: URL, delegate: @escaping (JournalEntry) -> Void) {
		guard FileManager.default.fileExists(atPath: path.absoluteURL.path) else {
			return nil
		}

		self.saveLocation = path.absoluteURL
		self.delegate = delegate
		monitoredFiles = [:]
		self.monitor = nil
		self.monitor = try? FileMonitor(directory: saveLocation, delegate: self)

		let dirOptions: FileManager.DirectoryEnumerationOptions = [.skipsHiddenFiles, .skipsPackageDescendants, .skipsSubdirectoryDescendants]
		if let files = try? FileManager.default.contentsOfDirectory(at: saveLocation, includingPropertiesForKeys: nil, options: dirOptions) {
			// handle log files
			for file in files.filter({ $0.pathExtension == "log" }).sorted(by: { $0.lastPathComponent.compare($1.lastPathComponent) == .orderedAscending }) {
				update(path: file)
			}

			// then handle jsons
			for file in files.filter({ $0.pathExtension == "json" }) {
				update(path: file)
			}
		}
	}

	private let saveLocation: URL
	private let delegate: (JournalEntry) -> Void
	private var monitoredFiles: [String: JournalFile]
	private var monitor: FileMonitor?
	public var mostRecentLog: JournalFile?
	public var activeFiles: [JournalFile] {
		monitoredFiles.values.filter({ !$0.isComplete })
	}

	private func update(path: URL) {
		guard path.pathExtension == "json" || path.pathExtension == "log" else {
			return
		}

		let key = path.lastPathComponent
		if let file = monitoredFiles[key] {
			file.update()

			if file.isComplete {
				monitoredFiles.removeValue(forKey: key)
			}
		} else {
			guard let file = JournalFile(filePath: path, delegate: delegate) else {
				return
			}

			guard !file.isComplete else {
				return
			}

			monitoredFiles[key] = file

			guard file.isStream else {
				return
			}

			let previous = mostRecentLog
			mostRecentLog = file
			guard let recent = previous else {
				return
			}

			recent.complete()
			monitoredFiles.removeValue(forKey: recent.path.lastPathComponent)
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
