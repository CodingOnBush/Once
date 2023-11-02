//
//  AlarmTabButton.swift
//  Once
//
//  Created by Mostafa on 16/10/2023.
//

import SwiftUI

struct TabComponent: View {
    var iconName: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .frame(width: 28, height: 28)
            Text("Réveil")
                .font(
                    Font.custom("Inter", size: 11)
                        .weight(.bold)
                )
                .foregroundColor(Color(red: 0.99, green: 0.9, blue: 0.83))
        }
        .padding(10)
        .frame(width: 109, alignment: .center)
    }
}

#Preview {
    TabComponent(iconName: "alarmTab")
}
