// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Testing

@testable import PrismaticCodex

@Test func frontierIdInvalid() throws {
	let symbol = FrontierId("A0")

	#expect(symbol.value == UInt.max)
}

@Test func frontierIdInvalidNumber() throws {
	let symbol = FrontierId("FQ")

	#expect(symbol.value == UInt.max)
}

@Test func frontierId() throws {
	let symbol = FrontierId("F1000")

	#expect(symbol.value == 1000)
}

@Test func frontierIdEquivalence() throws {
	let symbol = FrontierId("F1000")

	#expect(symbol == 1000)
	#expect(symbol.description == "F1000")
}

@Test func frontierIdInt() throws {
	let symbol = FrontierId(1000)

	#expect(symbol == 1000)
}
