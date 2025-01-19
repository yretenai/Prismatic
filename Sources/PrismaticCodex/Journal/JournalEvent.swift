// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

public enum JournalEvent: String, CaseInsensitiveEnum {
	case invalidEvent
	case fileHeader
	case cargo
	case continued
	case shutdown
}
