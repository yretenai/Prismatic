// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

struct JournalEventRegistry: Sendable {
	fileprivate typealias Registry = [JournalEvent: JournalEntry.Type]
	private let typeRegistry: Registry

	public static let `default`: JournalEventRegistry = JournalEventRegistry()

	init() {
		var typeRegistry: Registry = [:]

		typeRegistry[.fileHeader] = JournalFileHeader.self
		typeRegistry[.cargo] = JournalCargo.self

		self.typeRegistry = typeRegistry
	}

	public func load(json: [String: Any]) -> JournalEntry {
		guard let event = JournalEvent(caseInsensitiveRawValue: json["event"] as? String) else {
			return JournalFileHeader(json: json, event: .invalidEvent)
		}

		guard let type = typeRegistry[event] else {
			return JournalFileHeader(json: json, event: event)
		}

		return type.init(json: json, event: event)
	}
}
