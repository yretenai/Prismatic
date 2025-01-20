// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Basic generic class for all journal entries.
public class JournalEntry: CustomStringConvertible, CustomDebugStringConvertible {
	init(json: [String: Any], event: JournalEvent) {
		self.event = event
		timestamp = (try? Date(json["timestamp"] as? String ?? "2016-07-22T10:20:01Z", strategy: .iso8601)) ?? Date(timeIntervalSince1970: 0)
		rawData = json
	}

	public var description: String {
		"\(event) (\(rawData["event"] as? String ?? "unknown")) event at \(timestamp)"
	}

	public var debugDescription: String {
		guard let json = try? JSONSerialization.data(withJSONObject: rawData, options: .prettyPrinted) else {
			return description
		}

		return String(data: json, encoding: .utf8) ?? description
	}

	/// The time in GMT.
	public let timestamp: Date

	/// The event for this journal line.
	public let event: JournalEvent

	/// The raw underlying JSON data.
	public let rawData: [String: Any]

	public static func load(json: [String: Any]) -> JournalEntry? {
		let event = JournalEvent(caseInsensitiveRawValue: json["event"] as? String) ?? .invalidEvent

		switch event {
			case .fileHeader:
				return JournalFileHeader(json: json, event: event)
			case .cargo:
				return JournalCargo(json: json, event: event)
			default:
				return JournalEntry(json: json, event: event)
		}
	}
}
