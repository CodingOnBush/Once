//
//  DayCellView.swift
//  Once
//
//  Created by Mostafa on 20/10/2023.
//

import SwiftUI

struct DayCellView: View {
    var bgColor: Color
    var cellWidth: CGFloat
    var cellHeight: CGFloat
    var day: String
    var dayNumber: String
    var withDot: Bool
    
    var body: some View {
        ZStack {
            bgColor
            VStack() {
                Text(day)
                    .font(Font.custom("Inter", size: 17))
                Text(dayNumber)
                    .font(.custom("Inter-Bold", size: 23))
            }
            .foregroundStyle(.text)
        }
        .cornerRadius(18)
        .frame(width: cellWidth, height: cellHeight)
        .overlay(alignment: .topTrailing, content: {
            if withDot {
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.text)
                    .padding([.top, .trailing], cellHeight / 10)
            }
        })
    }
}

struct DayCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayCellView(bgColor: .accentColor2, cellWidth: 80, cellHeight: 90, day: "Lun", dayNumber: "09", withDot: false)
            DayCellView(bgColor: .clear, cellWidth: 80, cellHeight: 90, day: "Lun", dayNumber: "09", withDot: false)
            DayCellView(bgColor: .accentColor2, cellWidth: 80, cellHeight: 90, day: "Lun", dayNumber: "09", withDot: true)
            DayCellView(bgColor: .clear, cellWidth: 80, cellHeight: 90, day: "Lun", dayNumber: "09", withDot: true)
        }
        .padding()
        .background(Color.background)
        .previewLayout(.sizeThatFits)
    }
}
