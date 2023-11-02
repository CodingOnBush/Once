//
//  AlarmView.swift
//  Once
//
//  Created by Mostafa on 17/10/2023.
//

import SwiftUI

struct AlarmView: View {
    @State private var showSettingsView = false
    @State private var selectedHour = 7 // Heure initiale
    @State private var selectedMinute = 45 // Minute initiale
    @State private var elementsPosition: [CGRect] = []
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                HeaderView(
                    title: "Réveil",
                    buttonSystemName: "gearshape",
                    action: {
                        self.showSettingsView = true
                    }
                )

                Spacer()
                
                HStack {
                    Picker("", selection: $selectedHour){
                        ForEach(0..<24, id: \.self) { i in
                            VStack {
                                Text(i < 10 ? "0\(i)" : "\(i)").tag(i)
                                    .font(.custom("Inter-Bold", size: 74))
                                .foregroundStyle(.text)
                            }
                        }
                    }.pickerStyle(WheelPickerStyle())
                    
                    Text(":")
                        .font(.custom("Inter-Bold", size: 57))
                        .foregroundStyle(.text)
                    
                    Picker("", selection: $selectedMinute){
                        ForEach(0..<60, id: \.self) { i in
                            Text(i < 10 ? "0\(i)" : "\(i)").tag(i)
                                .font(.custom("Inter-Bold", size: 74))
                                .foregroundStyle(.text)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                Spacer()
            }
        }
        .sheet(isPresented: $showSettingsView, content: {
            SettingView()
        })
    }
}

#Preview {
    AlarmView()
}
