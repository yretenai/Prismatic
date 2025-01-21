// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Denotes that this event has body-related properties.
public protocol BodyRelatedEvent {
	var bodyName: String? { get }
	var bodyId: UInt? { get }
}
