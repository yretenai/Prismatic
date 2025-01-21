// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Denotes that this event has system-related properties.
public protocol SystemRelatedEvent {
	var systemName: String? { get }
	var systemAddress: UInt? { get }
}
