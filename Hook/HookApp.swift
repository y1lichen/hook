//
//  HookApp.swift
//  Hook
//
//  Created by 陳奕利 on 2024/5/17.
//

import SwiftUI

@main
struct HookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
