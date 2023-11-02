//
//  HeaderView.swift
//  Once
//
//  Created by Mostafa on 02/11/2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let buttonSystemName: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Inter-Bold", size: 42))
                .foregroundStyle(.text)
            
            Spacer()
            
            Button(action: { action() }, label: {
                Image(systemName: buttonSystemName)
                    .resizable()
                    .frame(width: 26, height: 26)
            })
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
    }
}
