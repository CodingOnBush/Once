//
//  OnceApp.swift
//  Once
//
//  Created by Mostafa on 16/10/2023.
//

import SwiftUI
import SwiftData

@main
struct OnceApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Habit.self)	
    }
}
