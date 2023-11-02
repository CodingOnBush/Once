//
//  SizePreferenceKey.swift
//  Once
//
//  Created by Mostafa on 19/10/2023.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
