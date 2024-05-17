//
//  ClipboardManager.swift
//  HookFinderExtension
//
//  Created by 陳奕利 on 2024/5/17.
//

import Foundation
import AppKit


extension NSPasteboard {
	static func setClipboard(_ content: String) {
		self.general.setString(content, forType: .URL)
	}
}
