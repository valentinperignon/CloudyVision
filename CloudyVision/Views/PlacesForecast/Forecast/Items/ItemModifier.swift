//
//  ItemModifier.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 29/10/2023.
//

import CVCore
import SwiftUI

struct ItemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Material.regular, in: .rect(cornerRadius: UIConstants.blockRadius))
    }
}

extension View {
    func forecastItem() -> some View {
        return modifier(ItemModifier())
    }
}
