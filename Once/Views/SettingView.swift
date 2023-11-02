//
//  SettingView.swift
//  Once
//
//  Created by Mostafa on 02/11/2023.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .foregroundStyle(.text)
                Spacer()
            }
        }
    }
}

#Preview {
    SettingView()
}
