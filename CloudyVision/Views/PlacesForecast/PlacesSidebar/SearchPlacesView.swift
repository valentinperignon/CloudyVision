//
//  SearchPlacesView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 14/10/2023.
//

import SwiftUI

struct SearchPlacesView: View {
    let search: String

    var body: some View {
        if search.isEmpty {
            ContentUnavailableView.search
        } else {
            Text(verbatim: "Results for \(search)")
        }
    }
}

#Preview {
    SearchPlacesView(search: "Hello, World!")
}
