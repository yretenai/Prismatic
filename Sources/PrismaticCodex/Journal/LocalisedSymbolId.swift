// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// A symbol that may or may not be localised.
public struct LocalisedSymbolId: CustomStringConvertible {
	private static let symbolIdentifiers: CharacterSet = CharacterSet(charactersIn: "$;").union(.whitespacesAndNewlines)

	init(json: [String: Any], key: String) {
		rawValue = json[key] as? String ?? "$\(key)_unknown;"
		localisedValue = json["\(key)_Localised"] as? String
	}

	public var description: String {
		localisedValue ?? sanitizedValue
	}

	public var sanitizedValue: String {
		rawValue.trimmingCharacters(in: LocalisedSymbolId.symbolIdentifiers)
	}

	public let rawValue: String
	public let localisedValue: String?
}
