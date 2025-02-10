// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Basic generic class for all journal entries.
public class Journal: CustomStringConvertible, CustomDebugStringConvertible {
	public required init(json: PrismaticJsonObject, event: Event) {
		self.event = event
		timestamp = (try? Date(json["timestamp", default: "2016-07-22T10:20:01Z"], strategy: .iso8601)) ?? Date(timeIntervalSince1970: 0)
		rawData = json
	}

	public var description: String {
		"\(event) (\(rawData["event", default: "unknown"])) event at \(timestamp)"
	}

	public var debugDescription: String {
		return rawData.description
	}

	/// The time in GMT.
	public let timestamp: Date

	/// The event for this journal line.
	public let event: Event

	/// The raw underlying JSON data.
	public let rawData: PrismaticJsonObject
}
