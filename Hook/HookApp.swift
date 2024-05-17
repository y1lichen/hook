//
//  HookApp.swift
//  Hook
//
//  Created by 陳奕利 on 2024/5/17.
//

import SwiftUI
import FinderSync

@main
struct HookApp: App {
    let persistenceController = PersistenceController.shared
	
	init() {
		if !FIFinderSyncController.isExtensionEnabled {
			FIFinderSyncController.showExtensionManagementInterface()
		}
	}
    var body: some Scene {
        WindowGroup {
            LinksView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
	}
}
