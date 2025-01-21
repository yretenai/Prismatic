// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Testing

@testable import PrismaticCodex

@Test func localisedSymbolIdParsesCorrectly() throws {
	let mock: [String: Any] = [
		"Value": "$TestValue;",
		"Value_Localised": "Nya!",
	]

	let symbol = LocalisedSymbolId(json: PrismaticJsonObject(mock), key: "Value")

	#expect(symbol.description == "Nya!")
	#expect(symbol.localisedValue == "Nya!")
	#expect(symbol.rawValue == "$TestValue;")
	#expect(symbol.sanitizedValue == "TestValue")
}

@Test func localisedSymbolIdFallback() throws {
	let mock: [String: Any] = [
		"Value": "nya"
	]

	let symbol = LocalisedSymbolId(json: PrismaticJsonObject(mock), key: "Value")

	#expect(symbol.description == "nya")
	#expect(symbol.localisedValue == nil)
	#expect(symbol.rawValue == "nya")
	#expect(symbol.sanitizedValue == "nya")
}

@Test func localisedSymbolIdMissing() throws {
	let mock: [String: Any] = [:]

	let symbol = LocalisedSymbolId(json: PrismaticJsonObject(mock), key: "Value")

	#expect(symbol.description == "Value_unknown")
	#expect(symbol.localisedValue == nil)
	#expect(symbol.rawValue == "$Value_unknown;")
	#expect(symbol.sanitizedValue == "Value_unknown")
}
