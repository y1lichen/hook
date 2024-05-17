//
//  FileManager.swift
//  HookFinderExtension
//
//  Created by 陳奕利 on 2024/5/17.
//

import Foundation

class FileOperationManager {
    static let defaultDir = NSHomeDirectory() + "/Documents/Hook/"
    static func createDefaultDirectory() {
        do {
            NSLog(NSHomeDirectory().description)
            try FileManager.default.createDirectory(atPath: defaultDir, withIntermediateDirectories: false, attributes: nil)
        } catch {
            //			print(error)
        }
    }

    static func createAlias(fromPath: String, toPath: String) -> URL? {
        if fromPath.isEmpty || toPath.isEmpty {
            return nil
        }
        do {
            let url = URL(fileURLWithPath: fromPath)
            let aliasUrl = URL(fileURLWithPath: toPath)
            let data = try url.bookmarkData(options: .suitableForBookmarkFile, includingResourceValuesForKeys: nil, relativeTo: nil)
            try URL.writeBookmarkData(data, to: aliasUrl)
            return aliasUrl
        } catch {
            NSLog(error.localizedDescription)
            return nil
        }
    }

    static func getFileLink(_ path: URL) -> String {
        return path.absoluteString
    }

    static func getMDLink(_ path: URL) -> String {
        let filename = path.lastPathComponent.split(separator: ".").first
		return "[\(filename ?? "\(path.lastPathComponent)")]" + "(" + path.relativePath + ")"
    }
}
