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
