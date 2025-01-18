// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// A symbol that may or may not be localised.
public struct LocalisedSymbolId {
	init(json: [String: Any], key: String) {
		rawValue = json[key] as? String ?? "$\(key)_unknown;"
		localisedValue = json["\(key)_Localised"] as? String ?? rawValue
	}

	public var description: String {
		localisedValue
	}

	public let rawValue: String
	public let localisedValue: String
}
