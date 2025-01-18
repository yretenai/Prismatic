// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Dispatch
import Foundation
import TSCFileSystem

/// Monitors a specific journal file.
public class JournalFile {
	init?(filePath: String) {
		guard let fileHandle = FileHandle(forReadingAtPath: filePath) else {
			return nil	
		}

		handle = fileHandle
		watch = nil

		// todo: process journal, continue if no Continue or Shutdown event is found

		guard let path =  try? AbsolutePath(validating: filePath) else {
			return
		}

		watch = FSWatch(paths: [path], block: { _ in self.update() })
	}

	private func update() {

	}

	private let handle: FileHandle
	private var watch: FSWatch?
}
