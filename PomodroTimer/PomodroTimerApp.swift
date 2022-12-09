//
//  PomodroTimerApp.swift
//  PomodroTimer
//
//  Created by Abdullah Karaboğa on 10.12.2022.
//

import SwiftUI

@main
struct PomodroTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
