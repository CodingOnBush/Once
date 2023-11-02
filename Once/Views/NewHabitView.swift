//
//  NewHabitView.swift
//  Once
//
//  Created by Mostafa on 01/11/2023.
//

import SwiftUI

struct NewHabitView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment (\.presentationMode) var presentationMode
    @State var habitTitle: String = ""
    @State var useHaptic: Bool = false
    @FocusState var textFieldIsFocused: Bool
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
                .onTapGesture {
                    self.textFieldIsFocused = false
                }
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.text)
                    })
                    .padding(30)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("What's your new habit ?")
                        .font(.custom("Inter-ExtraBold", size: 32))
                        .foregroundStyle(.text)
                        .padding(.leading, 30)
                    TextField("Tap to write", text: $habitTitle)
                        .font(.custom("Inter", size: 32))
                        .foregroundStyle(.text)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 8)
                        .focused($textFieldIsFocused, equals: true)
                }
                
                Button(action: {
                    modelContext.insert(Habit(title: self.habitTitle, days: [.now]))
                    self.useHaptic.toggle()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Create habit")
                        .font(.custom("Inter-Bold", size: 18))
                        .foregroundStyle(Color.background)
                        .frame(width: 236, height: 40, alignment: .center)
                        .background(.text)
                        .cornerRadius(16)
                })
                .padding(.top, 30)
                
                Spacer()
            }
        }
        .sensoryFeedback(.success, trigger: self.useHaptic)
        .onAppear {
            self.textFieldIsFocused = true
        }
    }
}

//#Preview {
//    NewHabitView()
//}
