//
//  HabitCell.swift
//  Once
//
//  Created by Mostafa on 21/10/2023.
//

import SwiftUI

struct HabitCell: View {
    @Environment(\.modelContext) private var modelContext
    @State var habit: Habit
    var daySelected: Date
    @State var newCellSelected: Bool = false
    @State var showAlert: Bool = false
    
    var body: some View {
        HStack {
            if habitAlsoDone() {
                Image("box.selected")
                    .padding(.leading, 16)
            } else {
                Image("box")
                    .padding(.leading, 16)
            }
            Text("\(habit.title)")
                .font(.custom("Inter", size: 18))
                .foregroundStyle(.text)
            Spacer()
            Text("\(habit.days.count)")
                .font(.custom("Inter-Bold", size: 14))
                .foregroundStyle(.text)
                .padding(.trailing, 16)
        }
        .padding(.vertical, 16)
        .background(habitAlsoDone() ? .accentColor2 : .background)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .inset(by: 0.5)
                .stroke(.accentColor2, lineWidth: 1)
        )
        .contextMenu(ContextMenu(menuItems: {
            Button(action: {
                self.showAlert.toggle()
            }, label: {
                Label("Remove habits", systemImage: "trash")
            })
        }))
        .onTapGesture {
            toggleCell()
        }
        .sensoryFeedback(.success, trigger: newCellSelected)
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("Delete \(self.habit.title)"),
                message: Text("Are you sure to delete this habit with all of your tracks ?"),
                primaryButton: .destructive(Text("Delete"), action: {
                    modelContext.delete(habit)
                }),
                secondaryButton: .cancel()
            )
        })
    }
    
    func removeDay(day: Date) {
        for i in 0...self.habit.days.count {
            if habit.days[i] == day {
                habit.days.remove(at: i)
                return
            }
        }
    }
    
    func habitAlsoDone() -> Bool {
        let dayDigit = daySelected.formatted(.dateTime.day(.defaultDigits))
        let monthDigit = daySelected.formatted(.dateTime.month(.defaultDigits))
        let yearDigit = daySelected.formatted(.dateTime.year(.defaultDigits))
        
        for day in habit.days {
            if day.formatted(.dateTime.day(.defaultDigits)) == dayDigit &&
                day.formatted(.dateTime.month(.defaultDigits)) == monthDigit &&
                day.formatted(.dateTime.year(.defaultDigits)) == yearDigit
            {
                return true
            }
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
    
    func toggleCell() {
        var found = false
        for day in habit.days {
            if compareDates(day, daySelected) {
                found = true
                removeDay(day: day)
            }
        }
        if found == false {
            habit.days.append(daySelected)
            self.newCellSelected.toggle()
        }
    }
}

//struct HabitCell_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            HabitCell(habit: Habit(title: "Habit title", days: []), daySelected: .now)
//        }
//        .padding()
//        .background(Color.background)
//        .previewLayout(.sizeThatFits)
//    }
//}
