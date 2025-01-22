// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// A symbol that may or may not be localised.
public struct EliteSymbol: CustomStringConvertible, CustomDebugStringConvertible {
	public enum EliteSymbolParseError: Error {
		case unexpectedState(index: Int, state: Item.State)
		case emptyItemKey(index: Int)
		case emptyTokenKey(index: Int)

		public var localizedDescription: String {
			switch self {
				case .unexpectedState(let index, let state):
					return "Did not expect to be in the \(state) state at position \(index)"
				case .emptyItemKey(let index):
					return "Tried to insert an empty item key at position \(index)"
				case .emptyTokenKey(let index):
					return "Tried to insert an empty token at position \(index)"
			}
		}
	}

	public struct ItemParam: CustomStringConvertible, CustomDebugStringConvertible {
		init(key: String, value: Item) {
			self.key = key
			self.value = value
		}
		public let key: String
		public let value: Item

		public var description: String {
			"\(key) = \(value.description)"
		}

		public var debugDescription: String {
			var key = key
			for token in Item.Token.allCases {
				key.replace("\(token.rawValue)", with: "\\\(token.rawValue)")
			}

			return "#\(key)=\(value.debugDescription)"
		}
	}

	public struct Item: CustomStringConvertible, CustomDebugStringConvertible {
		init(raw: String) {
			key = raw
			params = nil
			isLiteral = true
		}

		init(key: String, params: [ItemParam]?) {
			self.key = key
			isLiteral = false
			if let params = params, !params.isEmpty {
				self.params = params
			} else {
				self.params = nil
			}
		}

		public let key: String
		public let params: [ItemParam]?
		public let isLiteral: Bool

		public var description: String {
			key
		}

		public var debugDescription: String {
			var key = key
			for token in Token.allCases {
				key.replace("\(token.rawValue)", with: "\\\(token.rawValue)")
			}

			if isLiteral {
				return key
			}

			var reconstructed = "$\(key)"

			if let params = params, !params.isEmpty {
				for param in params {
					reconstructed += ":\(param.debugDescription)"
				}
			}

			return reconstructed + ";"
		}

		private static let keyTerminators: [Character] = [";", ":"]

		public enum State: Sendable {
			case literal
			case key
			case items
			case itemKey
			case itemValue
			case end
		}

		fileprivate enum Token: Character, CaseIterable {
			case escape = "\\"
			case start = "$"
			case end = ";"
			case itemSeparator = ":"
			case itemKey = "#"
			case itemValue = "="
		}

		public static func parse(value: String) throws -> Item? {
			if value.isEmpty {
				return nil
			}

			if value.first != "$", value.count == 1 {
				return Item(raw: value)
			}

			var index = value.index(after: value.startIndex)
			return try parse(value: value, index: &index)
		}

		public static func parse(value: String, index: inout String.Index) throws -> Item {
			if value.first != "$", value.count == 1 {
				return Item(raw: value)
			}

			var state: State = .key
			var key: String = ""
			var itemKey: String? = nil
			var values: [ItemParam]? = nil
			var buffer: String = ""

			mainLoop: while index < value.endIndex {
				let char = value[index]
				index = value.index(index, offsetBy: 1)
				if let token = Token(rawValue: char) {
					switch token {
						case .escape:
							if index == value.endIndex {
								break
							}
							buffer.append(value[index])
							index = value.index(index, offsetBy: 1)
							break
						case .start:
							guard state == .itemValue else {
								throw EliteSymbolParseError.unexpectedState(index: value.distance(from: value.startIndex, to: index), state: state)
							}

							guard let key = itemKey,
								let items = values
							else {
								throw EliteSymbolParseError.emptyTokenKey(index: value.distance(from: value.startIndex, to: index))
							}

							values = items + [ItemParam(key: key, value: try parse(value: value, index: &index))]
							itemKey = nil
							break
						case .end, .itemSeparator:
							guard state == .key || state == .itemValue else {
								throw EliteSymbolParseError.unexpectedState(index: value.distance(from: value.startIndex, to: index), state: state)
							}
							if state == .key {
								key = buffer
							} else if state == .itemValue && !key.isEmpty, let key = itemKey {
								guard let items = values else {
									throw EliteSymbolParseError.emptyTokenKey(index: value.distance(from: value.startIndex, to: index))
								}

								values = items + [ItemParam(key: key, value: Item(raw: buffer))]
								itemKey = nil
							}
							buffer = ""
							if token == .end {
								state = .end
								break mainLoop
							} else {
								state = .items
								values = values ?? []
							}
							break
						case .itemKey:
							guard values != nil else {
								throw EliteSymbolParseError.unexpectedState(index: value.distance(from: value.startIndex, to: index), state: state)
							}
							state = .itemKey
							break
						case .itemValue:
							guard state == .itemKey else {
								throw EliteSymbolParseError.unexpectedState(index: value.distance(from: value.startIndex, to: index), state: state)
							}
							itemKey = buffer
							buffer = ""
							state = .itemValue
							break
					}

				} else {
					buffer.append(char)
				}
			}

			guard state == .end else {
				throw EliteSymbolParseError.unexpectedState(index: value.distance(from: value.startIndex, to: index), state: state)
			}

			return Item(key: key, params: values)
		}
	}

	private static let symbolIdentifiers: CharacterSet = CharacterSet(charactersIn: "$;").union(.whitespacesAndNewlines)

	init(json: PrismaticJsonObject, key: String) {
		rawValue = json[key]
		localisedValue = json["\(key)_Localised"]

		guard let rawValue = rawValue,
			!rawValue.isEmpty
		else {
			item = nil
			return
		}

		if rawValue.first != "$" {
			item = Item(raw: rawValue)
		} else {
			do {
				item = try Item.parse(value: rawValue)
			} catch {
				print(error.localizedDescription)
				item = Item(raw: rawValue)
			}
		}
	}

	public var description: String {
		localisedValue ?? item?.description ?? "unknown"
	}

	public var debugDescription: String {
		item?.debugDescription ?? "unknown"
	}

	public let rawValue: String?
	public let localisedValue: String?
	public let item: Item?
}
