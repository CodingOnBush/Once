//
//  HabitCellViewModel.swift
//  Once
//
//  Created by Mostafa on 17/10/2023.
//

import SwiftUI

struct HabitCellViewModel {
    let habitTitle: String
    let cellIsSelected: Bool
    
    var backgroundColor: Color {
        return cellIsSelected ? .accentColor2 : .clear
    }
}
