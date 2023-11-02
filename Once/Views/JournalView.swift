//
//  JournalView.swift
//  Once
//
//  Created by Mostafa on 17/10/2023.
//

import SwiftUI

struct JournalView: View {
    @State var screenSize: CGSize = .zero
    @State var selectedDay: Date = .now
    let days: [Date] = [.now - (3 * 86400), .now - (2 * 86400), .now - 86400, .now]

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                HStack(spacing: 16) {
                    Text("Journal")
                        .font(.custom("Inter-Bold", size: 42))
                        .foregroundStyle(.text)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                }
                .padding(16)
                
                DayPanelView(selectedDay: $selectedDay, days: self.days)
                    .padding(.bottom, 24)
                
                Spacer()
            }
        }
        .overlay(
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { value in
            screenSize = value
        }
    }
    
    func getDateCellsSize() -> CGFloat {
        return ((screenSize.width - 32) / 4) - 2
    }
}

#Preview {
    JournalView()
}
