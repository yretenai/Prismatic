// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Testing

@testable import PrismaticCodex

@Test func eliteSymbolParsesCorrectly() throws {
	let mock: [String: Any] = [
		"Value": "$TestValue;",
		"Value_Localised": "Nya!",
	]

	let symbol = EliteSymbol(json: PrismaticJsonObject(mock), key: "Value")

	#expect(symbol.description == "Nya!")
	#expect(symbol.localisedValue == "Nya!")
	#expect(symbol.rawValue == "$TestValue;")
	#expect(symbol.item?.key == "TestValue")
}

@Test func eliteSymbolFallback() throws {
	let mock: [String: Any] = [
		"Value": "nya"
	]

	let symbol = EliteSymbol(json: PrismaticJsonObject(mock), key: "Value")

	#expect(symbol.description == "nya")
	#expect(symbol.localisedValue == nil)
	#expect(symbol.rawValue == "nya")
	#expect(symbol.item?.key == "nya")
}

@Test func eliteSymbolMissing() throws {
	let mock: [String: Any] = [:]

	let symbol = EliteSymbol(json: PrismaticJsonObject(mock), key: "Value")

	#expect(symbol.localisedValue == nil)
	#expect(symbol.rawValue == nil)
	#expect(symbol.item == nil)
}

@Test func eliteSymbolParams() throws {
	let mock: [String: Any] = [
		"Symbol": "$SAA_Unknown_Signal:#type=$SAA_SignalType_Geological;:#index=9;"
	]

	let symbol = EliteSymbol(json: PrismaticJsonObject(mock), key: "Symbol")
	#expect(symbol.item?.debugDescription == "$SAA_Unknown_Signal:#type=$SAA_SignalType_Geological;:#index=9;")
	// todo: check graph
}

@Test func eliteSymbolNestedParams() throws {
	let mock: [String: Any] = [
		"Symbol": "$Nya:#type=$Nya:#mews=10:#nested=$Nested;;:#index=\\:3;"
	]

	let symbol = EliteSymbol(json: PrismaticJsonObject(mock), key: "Symbol")
	#expect(symbol.item?.debugDescription == "$Nya:#type=$Nya:#mews=10:#nested=$Nested;;:#index=\\:3;")
	// todo: check graph
}
