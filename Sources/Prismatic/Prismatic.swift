// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation
import PrismaticCodex

enum PrismaticError: LocalizedError {
	case saveFilePathNotFound(path: String)
	case invalidArgs

	var failureReason: String? {
		switch self {
			case .saveFilePathNotFound(let path):
				return "The path \(path) does not exist."
			case .invalidArgs:
				return "Invalid number of arguuments provided."
		}
	}

	var helpAnchor: String? {
		switch self {
			case .saveFilePathNotFound(_):
				return "Provide a path to the directory that contains Journal files, i.e. \"Journal.2025-01-23T155548.01.log\"."
			case .invalidArgs:
				return "Usage: \(CommandLine.arguments[0]) path/to/journal/directory"
		}
	}
}

@main
final class Prismatic {
	init(path logPath: String) throws {
		self.stream = nil

		guard let stream = JournalStream(saveDataPath: URL(fileURLWithPath: logPath, isDirectory: true), delegate: self.process) else {
			throw PrismaticError.saveFilePathNotFound(path: logPath)
		}

		self.stream = stream
	}

	private var stream: JournalStream?

	func process(event: JournalEntry) {
		print(event)
	}

	func run() {
		stream?.start()
	}

	static func main() {
		do {
			guard CommandLine.arguments.count >= 2 else {
				throw PrismaticError.invalidArgs
			}

			let prismatic = try Prismatic(path: CommandLine.arguments[1])
			prismatic.run()
			RunLoop.current.run()
		} catch {
			print(error.localizedDescription)
		}
	}
}
