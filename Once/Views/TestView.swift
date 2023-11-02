//
//  TestView.swift
//  Once
//
//  Created by Mostafa on 21/10/2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                LazyHStack {
                    TabView {
                        VStack {
                            Color.blue
                            Color.blue
                            Color.blue
                        }
                        .padding(16)
                        VStack {
                            Color.blue
                            Color.blue
                            Color.blue
                        }
                        .padding(16)
                        VStack {
                            Color.blue
                            Color.blue
                            Color.blue
                        }
                        .padding(16)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                .border(.green)
            }
//            .border(.red)
        }
    }
}

#Preview {
    TestView()
}
