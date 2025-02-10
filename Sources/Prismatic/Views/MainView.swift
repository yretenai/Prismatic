// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import SwiftTUI

@MainActor
struct MainView: @preconcurrency View {
	var body: some View {
		guard let recent = Prismatic.default.mostRecentEvent else {
			return Text("No Events")
		}

		return Text(String(describing: recent))
	}
}
