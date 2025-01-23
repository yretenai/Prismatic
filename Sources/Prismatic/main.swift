// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation
import PrismaticCodex

guard let stream = JournalStream(saveDataPath: URL(fileURLWithPath: "~/.config/elite-logs", isDirectory: true), delegate: { print($0) })
else {
	exit(0)
}

print("running")
stream.start()
print("waiting")
RunLoop.current.run()
