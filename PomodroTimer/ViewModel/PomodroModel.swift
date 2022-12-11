//
//  PomodroModel.swift
//  PomodroTimer
//
//  Created by Abdullah Karaboğa on 10.12.2022.
//

import SwiftUI

class PomodroModel: NSObject, ObservableObject {

    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"

    @Published var hour: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    @Published var isStarted: Bool = false
    @Published var addNewTimer: Bool = false

    func startTimer() {

        withAnimation(.easeOut(duration: 0.25)) {
            isStarted = true
        }

        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minutes >= 10 ? "\(minutes)" : "0\(minutes)")"

    }


    func stopTimer() {

    }

    func updateTimer() {

    }
}


