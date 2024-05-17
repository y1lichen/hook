//
//  FileManager.swift
//  HookFinderExtension
//
//  Created by 陳奕利 on 2024/5/17.
//

import Foundation

class FileMenuManager {
	static let defaultDir = NSHomeDirectory() + "/Documents/Hook/"
    static func createDefaultDirectory() {
        do {
			NSLog(NSHomeDirectory().description)
			try FileManager.default.createDirectory(atPath: defaultDir, withIntermediateDirectories: false, attributes: nil)
        } catch {
            //			print(error)
        }
    }
	
	static func createSymLink(fromPath: String, toDestinationPath: String) {
		if fromPath.isEmpty || toDestinationPath .isEmpty {
			return
		}
		do {
			let url = URL(fileURLWithPath: fromPath)
			let aliasUrl = URL(fileURLWithPath: toDestinationPath)
			let data = try url.bookmarkData(options: .suitableForBookmarkFile, includingResourceValuesForKeys: nil, relativeTo: nil)
			try URL.writeBookmarkData(data, to: aliasUrl)
		} catch {
			NSLog(error.localizedDescription)
		}
	}
}
