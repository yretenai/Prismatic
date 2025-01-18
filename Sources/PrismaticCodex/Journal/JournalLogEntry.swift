// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Basic generic class for all journal entries.
public class JournalEntry {
	init(json: [String: Any]) {
		timestamp = (try? Date(json["timestamp"] as? String ?? "2016-07-22T10:20:01Z", strategy: .iso8601)) ?? Date(timeIntervalSince1970: 0)
		event = JournalEvent(caseInsensitiveRawValue: json["event"] as? String) ?? .invalidEvent
		rawData = json
	}

	public var description: String {
		"\(event) event at \(timestamp)"
	}

	/// The time in GMT.
	public let timestamp: Date

	/// The event for this journal line.
	public let event: JournalEvent

	/// The raw underlying JSON data.
	public let rawData: [String: Any]

	public static func loadJournal(json: [String: Any]) -> JournalEntry? {
		let event = JournalEvent(caseInsensitiveRawValue: json["event"] as? String) ?? .invalidEvent

		switch event {
			case .fileHeader:
				return JournalFileHeader(json: json)
			case .cargo:
				return JournalCargo(json: json)
			default:
				return JournalEntry(json: json)
		}
	}
}
