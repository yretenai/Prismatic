// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

extension Journal {
	/// An attributor mutator for an engineered module.
	public struct Mutator: PrismaticObject {
		public init(json: PrismaticJsonObject) {
			attribute = ModuleAttribute(rawValue: json["Label"]) ?? .unknown
			value = json["Value", default: 0.0]
			originalValue = json["OriginalValue", default: 0.0]
			lessIsGood = json["LessIsGood", default: 0] == 1
		}

		public let attribute: ModuleAttribute
		public let value: Double
		public let originalValue: Double
		public let lessIsGood: Bool
	}
}
