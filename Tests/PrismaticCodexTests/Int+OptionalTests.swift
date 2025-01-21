// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Testing

@testable import PrismaticCodex

@Test func intNil() throws {
	let value = Int(nil as String?, radix: 10)
	#expect(value == nil)
}

@Test func intValue() throws {
	let value = Int("10" as String?, radix: 10)
	#expect(value == 10)
}
