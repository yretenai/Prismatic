// SPDX-FileCopyrightText: 2025 Legiayayana <ada@chronovore.dev>
// SPDX-License-Identifier: EUPL-1.2

import Foundation

extension URL {
	var fileName: String {
		self.lastPathComponent
	}

	var fileNameWithoutExtension: String {
		let ext = pathExtension
		let name = fileName
		guard !ext.isEmpty && name.count > (ext.count + 2) else {
			return name
		}

		return String(name[...name.index(name.endIndex, offsetBy: 0 - (ext.count + 2))])
	}
}
