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
                .preferredColorScheme(.dark)
        }
        .modelContainer(for: Habit.self)	
    }
}
