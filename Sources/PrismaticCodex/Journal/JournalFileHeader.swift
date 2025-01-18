// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Describbes an incremental journal file.
///
/// If the play session goes on a long time, and the journal gets very large, the file will be closed and a
/// new file started with an increased part number: the heading entry is added at the beginning of every
/// file. See also the "Continued" event.
public class JournalFileHeader: JournalEntry {
	override init(json: [String: Any]) {
		part = Int(json["part"] as? String, radix: 10) ?? 0
		language = json["language"] as? String ?? "English/XX"
		gameVersion = json["gameversion"] as? String ?? "4.0.0.0"
		build = json["build"] as? String ?? "r0"
		isOdyssey = json["Odyssey"] as? Bool ?? false

		super.init(json: json)
	}

	public override var description: String {
		"\(super.description), part \(part) for game version = \(gameVersion) (\(build), \(language) \(isOdyssey ? "ODYSSEY" : "LEGACY"))"
	}

	/// The file part number, this will be incremented if a continued event is emitted.
	public let part: Int

	/// The language code the game is currently running in.
	public let language: String

	/// Which version of the game that produced the log.
	public let gameVersion: String

	/// Which build number of the game that produced the log.
	public let build: String

	/// Whether or not we are running odyssey or legacy.
	public let isOdyssey: Bool
}
