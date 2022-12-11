//
//  PomodroTimerApp.swift
//  PomodroTimer
//
//  Created by Abdullah Karaboğa on 10.12.2022.
//

import SwiftUI

@main
struct PomodroTimerApp: App {
    
    @Environment(\.scenePhase) var phase
    
    @StateObject var pomodroModel: PomodroModel = .init()
    
    @State var lastActiveTimeStamp: Date = Date()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(pomodroModel)
        }.onChange(of: phase) {
            newValue in
            if pomodroModel.isStarted {
                if newValue == .background{
                    lastActiveTimeStamp = Date()
                }
            }
            
            if newValue == .active {
                let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                if pomodroModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                    pomodroModel.isStarted = false
                    pomodroModel.totalSeconds = 0
                    pomodroModel.isFinished = true
                } else {
                    pomodroModel.totalSeconds -= Int(currentTimeStampDiff)
                }
                
                
            }
        }
    }}
