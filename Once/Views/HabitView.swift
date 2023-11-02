//
//  HabitView.swift
//  Once
//
//  Created by Mostafa on 17/10/2023.
//

import SwiftUI
import SwiftData

struct HabitView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var habits: [Habit]
    @EnvironmentObject var habitsViewModel: HabitsViewModel
    
    @State var selectedDay: Date = .now
    @State var selectedPage: Int = 3
    @State var showNewHabitSheet: Bool = false
    let days: [Date] = [.now - (3 * 86400), .now - (2 * 86400), .now - 86400, .now]
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                HStack(spacing: 24) {
                    Text("Habitude")
                        .font(.custom("Inter-Bold", size: 42))
                        .foregroundStyle(.text)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 26, height: 26)
                    })
                    Button(action: {
                        self.showNewHabitSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 26, height: 26)
                    })
                }
                .padding(.bottom, 32)
                .padding(.horizontal, 24)
                
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
            .padding(16)
            .sheet(isPresented: $showNewHabitSheet) {
                NewHabitView()
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





//
//struct HabitView_Previews: PreviewProvider {
//    static var previews: some View {
//        HabitView()
//    }
//}
//