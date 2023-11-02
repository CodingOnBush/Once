//
//  HabitsViewModel.swift
//  Once
//
//  Created by Mostafa on 21/10/2023.
//

import SwiftUI
import SwiftData

class HabitsViewModel: ObservableObject {
    private var modelContext: ModelContext
    @Query var habits: [Habit]
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func getTodayHabits() -> [Habit] {
        var todayHabits: [Habit] = []
        for habit in habits {
            if isToday() {
                todayHabits.append(habit)
            }
        }
        return habits
    }
    
    func isToday() -> Bool {
        return true
    }
    
    func createNewHabit(habit: Habit) {
        modelContext.insert(habit)
    }
}
