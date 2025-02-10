// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Frontier Account Id ("F####").
public struct FrontierId: LosslessStringConvertible {
	public init(_ description: String) {
		guard description.count > 1 && description.first == "F" else {
			value = UInt.max
			return
		}

		guard let value = UInt(description[description.index(description.startIndex, offsetBy: 1)...], radix: 10) else {
			value = UInt.max
			return
		}

		self.value = value
	}

	public init(_ id: UInt) {
		value = id
	}

	public var description: String {
		"F\(value)"
	}

	public let value: UInt

	public static func == (lhs: Self, rhs: UInt) -> Bool {
		return lhs.value == rhs
	}
}
