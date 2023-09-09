//
//  AnimatableTitle.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 09/09/2023.
//

import SwiftUI

struct AnimatableTitle: View, Animatable {
    let title: String
    var typingCount: Int

    var animatableData: Double {
        get { Double(typingCount) }
        set { typingCount = Int(ceil(newValue)) }
    }

    var body: some View {
        Text(title.prefix(typingCount))
            .monospaced()
            .font(.system(size: 56))
    }
}

#Preview {
    AnimatableTitle(title: "Example title", typingCount: 8)
}
