// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Testing

@testable import PrismaticCodex

private enum TestEnum: String, CaseInsensitiveEnum {
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

@Test func enumCaseInsensitiveNil() throws {
	let value = TestEnum(caseInsensitiveRawValue: nil)
	#expect(value == nil)
}

@Test func enumCaseInsensitive() throws {
	let value = TestEnum(caseInsensitiveRawValue: "NYA")
	#expect(value == .nya)
}

@Test func enumCaseInsensitiveInvalid() throws {
	let value = TestEnum(caseInsensitiveRawValue: "MEOW")
	#expect(value == nil)
}
