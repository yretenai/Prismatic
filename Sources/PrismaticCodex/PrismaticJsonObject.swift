// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

/// Protocol to allow objects to be initialized using JSON data.
public protocol PrismaticObject {
	init(json: PrismaticJsonObject)
}

/// Wrapper around JSONSerialization's [String: Any] to give some semblance of type hinting.
public struct PrismaticJsonObject: LosslessStringConvertible {
	@usableFromInline
	var data: [String: Any]

	public init(_ data: [String: Any]) {
		self.data = data
	}

	public init?(data: Data) {
		guard let data = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
			return nil
		}

		self.data = data
	}

	public init?(_ description: String) {
		guard let data = description.data(using: .utf8),
			let data = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
		else {
			return nil
		}

		self.data = data
	}

	public var description: String {
		guard let data = try? JSONSerialization.data(withJSONObject: data) else {
			return "json error"
		}

		return String(data: data, encoding: .utf8) ?? "encode error"
	}

	@inlinable subscript<T>(_ key: String, default defaultValue: @autoclosure () -> T) -> T {
		guard let value = data[key],
			let realValue = value as? T
		else {
			return defaultValue()
		}

		return realValue
	}

	@inlinable subscript<T>(_ key: String, default defaultValue: @autoclosure () -> T, nilOn nillCheck: (T) -> Bool) -> T {
		guard let value: T = self[key, nilOn: nillCheck] else {
			return defaultValue()
		}

		return value
	}

	@inlinable subscript<T>(_ key: String, nilOn nilCheck: (T) -> Bool) -> T? {
		guard let value = data[key],
			let realValue = value as? T
		else {
			return nil
		}

		if nilCheck(realValue) {
			return nil
		}

		return realValue
	}

	@inlinable subscript<T>(_ key: String) -> T? {
		return data[key] as? T
	}

	@inlinable subscript<T: PrismaticObject>(_ key: String) -> [T]? {
		return (data[key] as? [[String: Any]])?.map({ T(json: PrismaticJsonObject($0)) })
	}

	@inlinable subscript<T: PrismaticObject>(_ key: String, default defaultValue: @autoclosure () -> [T]) -> [T] {
		return self[key] ?? defaultValue()
	}

	@inlinable subscript<T: PrismaticObject>(_ key: String) -> T? {
		guard let json = data[key] as? [String: Any] else {
			return nil
		}

		return T(json: PrismaticJsonObject(json))
	}

	@inlinable subscript<T: PrismaticObject>(_ key: String, default defaultValue: @autoclosure () -> T) -> T {
		return self[key] ?? defaultValue()
	}
}
