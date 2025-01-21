// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Testing

@testable import PrismaticCodex

private enum TestEnum: String {
	case invalid
	case nya
}

@Test func enumRawRepresentableNil() throws {
	let value = TestEnum(rawValue: nil)
	#expect(value == nil)
}

@Test func enumRawRepresentableValue() throws {
	let value = TestEnum(rawValue: "nya" as String?)
	#expect(value == .nya)
}
