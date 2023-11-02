//
//  MainView.swift
//  Once
//
//  Created by Mostafa on 16/10/2023.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    var body: some View {
        TabView {
            AlarmView()
                .tabItem {
                    Label("Réveil", systemImage: "alarm.fill")
                }
            HabitView()
                .tabItem {
                    Label("Habitude", systemImage: "square")
                }
            JournalView()
                .tabItem {
                    Label("Journal", systemImage: "text.book.closed")
                }
            HabitView()
                .tabItem {
                    Label("Données", systemImage: "chart.bar.xaxis.ascending")
                }
        }
    }
}

#Preview {
    MainView()
}
