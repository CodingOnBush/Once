//
//  Journal.swift
//  Once
//
//  Created by Mostafa on 02/11/2023.
//

import Foundation
import SwiftData

@Model
class Journal: Identifiable {
    let id: String = UUID().uuidString
    let creationDate: Date = Date.now
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
