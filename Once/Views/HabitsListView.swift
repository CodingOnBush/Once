//
//  HabitsListView.swift
//  Once
//
//  Created by Mostafa on 22/10/2023.
//

import SwiftUI
import SwiftData

struct HabitsListView: View {
    @Query var habits: [Habit]
    var day: Date
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ForEach(habits, id: \.creationDate) { habit in
                    HabitCell(habit: habit, daySelected: self.day)
                        .padding(.horizontal, 16)
                }
                Spacer()
            }            
        }
        .onChange(of: habits) {
            for habit in habits {
                print("Habit \(habit.title)")
                for day in habit.days {
                    print(day.description)
                }
            }
        }
    }
}

#Preview {
    HabitsListView(day: .now)
}
