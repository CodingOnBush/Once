//
//  DayPanelView.swift
//  Once
//
//  Created by Mostafa on 01/11/2023.
//

import SwiftUI

struct DayPanelView: View {
    @Binding var selectedDay: Date
    var days: [Date]
    
    var body: some View {
        HStack {
            ForEach(days, id: \.timeIntervalSince1970) { d in
                VStack {
                    Text(d.formatted(.dateTime.weekday()))
                        .font(Font.custom("Inter", size: 17))
                    Text(d.formatted(.dateTime.day(.twoDigits)))
                        .font(.custom("Inter-Bold", size: 23))
                }
                .foregroundStyle(.text)
                .frame(width: 80, height: 90)
                .background(compareDates(selectedDay, d) ? Color.accentColor2 : .background)
                .cornerRadius(18)
                .overlay(alignment: .topTrailing, content: {
                    if compareDates(d, .now) {
                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundColor(.text)
                            .padding([.top, .trailing], 9)
                    }
                })
                .onTapGesture {
                    selectedDay = d
                }
            }
        }
    }
    
    func isToday(day: Date) -> Bool {
        let dayDigit = day.formatted(.dateTime.day(.defaultDigits))
        let monthDigit = day.formatted(.dateTime.month(.defaultDigits))
        let yearDigit = day.formatted(.dateTime.year(.defaultDigits))
        
        let today = Date.now
        
        if today.formatted(.dateTime.day(.defaultDigits)) == dayDigit &&
            today.formatted(.dateTime.month(.defaultDigits)) == monthDigit &&
            today.formatted(.dateTime.year(.defaultDigits)) == yearDigit
        {
            return true
        }
        return false
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
}
