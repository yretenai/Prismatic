// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation
import TSCFileSystem

/// Monitors journal files and continiously polls for new events.
public class JournalStream {
	/// The most recent journal version implemented.
	public static let journalVersion = 37

	init?(saveDataPath path: URL, delegate: any JournalHandler) {
		self.saveLocation = path.absoluteURL
		self.delegate = delegate
		monitoredFiles = [:]
		watch = nil

		guard let path = try? AbsolutePath(validating: saveLocation.path) else {
			return nil
		}

		watch = FSWatch(
			paths: [path],
			block: { [weak self] paths in
				guard let self = self else { return }
				for path in paths {
					self.update(path: URL(fileURLWithPath: path.pathString))
				}
			})
	}

	private let saveLocation: URL
	private let delegate: any JournalHandler
	private var watch: FSWatch?
	private var monitoredFiles: [URL: JournalFile]

	private func update(path: URL) {
		if let file = monitoredFiles[path] {
			file.update()

			if file.isComplete {
				monitoredFiles.removeValue(forKey: path)
			}
		} else {
			monitoredFiles[path] = JournalFile(filePath: path, delegate: delegate)
		}
	}

	private func start() throws {
		try watch?.start()
	}

	private func stop() {
		watch?.stop()
	}
}
