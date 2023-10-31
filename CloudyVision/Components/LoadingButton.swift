//
//  LoadingButton.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 31/10/2023.
//

import SwiftUI

struct LoadingButton<Label: View>: View {
    let isLoading: Bool
    let action: () -> Void
    @ViewBuilder let label: Label

    var body: some View {
        Button(action: action) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }

                label.opacity(isLoading ? 0 : 1)
            }
        }
        .allowsHitTesting(!isLoading)
    }
}

#Preview("Not Loading") {
    LoadingButton(isLoading: false) {
        /* Preview */
    } label: {
        Text(verbatim: "Hey, this is my button")
    }
}

#Preview("Loading") {
    LoadingButton(isLoading: true) {
        /* Preview */
    } label: {
        Text(verbatim: "Hey, this is my button")
    }
}
