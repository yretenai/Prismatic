// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

/// Denotes that this event has mission-related properties.
public protocol MissionRelatedEvent {
	var missionId: Int? { get }
}
