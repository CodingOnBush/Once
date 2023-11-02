//
//  AlarmView.swift
//  Once
//
//  Created by Mostafa on 17/10/2023.
//

import SwiftUI

struct AlarmView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Text("Réveil")
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
                
                Spacer()
            }
        }
    }
}

#Preview {
    AlarmView()
}
