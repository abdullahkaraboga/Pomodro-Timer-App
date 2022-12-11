//
//  PomodroTimerApp.swift
//  PomodroTimer
//
//  Created by Abdullah Karaboğa on 10.12.2022.
//

import SwiftUI

@main
struct PomodroTimerApp: App {
    @StateObject var pomodroModel: PomodroModel = .init()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(pomodroModel)
        }
    }
}
