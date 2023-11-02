//
//  JournalView.swift
//  Once
//
//  Created by Mostafa on 17/10/2023.
//

import SwiftUI

struct JournalView: View {
    @State var selectedDay: Date = .now
    @State var selectedPage: Int = 3
    let days: [Date] = [.now - (3 * 86400), .now - (2 * 86400), .now - 86400, .now]

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Journal")
                        .font(.custom("Inter-Bold", size: 42))
                        .foregroundStyle(.text)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                    Spacer()
                }
                
                DayPanelView(selectedDay: $selectedDay, days: self.days)
                    .padding(.bottom, 24)
                
                TabView(selection: $selectedPage) {
                    HabitsListView(day: days[0])
                        .tag(0)
                    HabitsListView(day: days[1])
                        .tag(1)
                    HabitsListView(day: days[2])
                        .tag(2)
                    HabitsListView(day: days[3])
                        .tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: UIScreen.main.bounds.width)
                
                Spacer()
            }
        }
        .onChange(of: self.selectedDay) {
            withAnimation {
                self.selectedPage = getNewSelectedPage()
            }
        }
        .onChange(of: self.selectedPage) {
            self.selectedDay = days[self.selectedPage]
        }
    }
    
    func compareDates(_ date1: Date, _ date2: Date) -> Bool {
        let dayDigit1 = date1.formatted(.dateTime.day(.defaultDigits))
        let monthDigit1 = date1.formatted(.dateTime.month(.defaultDigits))
        let yearDigit1 = date1.formatted(.dateTime.year(.defaultDigits))
        
        let dayDigit2 = date2.formatted(.dateTime.day(.defaultDigits))
        let monthDigit2 = date2.formatted(.dateTime.month(.defaultDigits))
        let yearDigit2 = date2.formatted(.dateTime.year(.defaultDigits))
        
        return dayDigit1 == dayDigit2 && monthDigit1 == monthDigit2 && yearDigit1 == yearDigit2
    }
    
    func getNewSelectedPage() -> Int {
        // iterate from i = 1 to i = 3
        for i in 0...days.count {
            if compareDates(days[i], selectedDay) {
                return i
            }
        }
        return days.count
    }
}

#Preview {
    JournalView()
}
