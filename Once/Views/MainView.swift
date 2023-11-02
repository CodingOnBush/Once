//
//  MainView.swift
//  Once
//
//  Created by Mostafa on 16/10/2023.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @State var selectedTab = "Habitude"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AlarmView()
                .tabItem {
                    VStack {
                        selectedTab == "Réveil" ? Image("alarm.fill") : Image(systemName: "alarm")
                        Text("Réveil")
                    }
                    .foregroundStyle(.text)
                }
                .tag("Réveil")
            HabitView()
                .tabItem {
                    selectedTab == "Habitude" ? Image("square.fill") : Image("square")
                    Text("Habitude")
                }
                .tag("Habitude")
                .modelContext(self.modelContext)
                .foregroundStyle(.text)
            JournalView()
                .tabItem {
                    selectedTab == "Journal" ? Image("journal.fill") : Image("journal")
                    Text("Journal")
                        .foregroundStyle(.text)
                }
                .tag("Journal")
            HabitView()
                .tabItem {
                    selectedTab == "Stats" ? Image(systemName: "chart.pie.fill") : Image(systemName: "chart.pie")
                    Text("Stats")
                }
                .tag("Stats")
                .modelContext(self.modelContext)
                .foregroundStyle(.text)
        }
    }
}

#Preview {
    MainView()
}
