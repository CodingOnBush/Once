//
//  Habit.swift
//  Once
//
//  Created by Mostafa on 21/10/2023.
//

import Foundation
import SwiftData

@Model
class Habit: Identifiable {
    let id: String = UUID().uuidString
    let creationDate: Date = Date.now
    var title: String
    var days: [Date]
    
    init(title: String, days: [Date]) {
        self.title = title
        self.days = days
    }
}
