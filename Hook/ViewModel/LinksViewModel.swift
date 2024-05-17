//
//  LinksViewModel.swift
//  Hook
//
//  Created by 陳奕利 on 2024/5/17.
//


import Foundation
import FinderSync

class LinksViewModel: ObservableObject {
	@Published var links: [URL] = []
	
	func fetchAllLinks() {
		do {
//			let dirContent = try FileManager.default.contentsOfDirectory(atPath: )
		} catch {
		}
	}
}
