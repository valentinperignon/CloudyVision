//
//  PlacesSidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 10/10/2023.
//

import SwiftUI

struct PlacesSidebarView: View {
    @State private var search = ""

    var body: some View {
        Group {
            if search.isEmpty {
                FavoritePlacesView()
            } else {
                SearchPlacesView(search: search)
            }
        }
        .searchable(text: $search)
    }
}

#Preview {
    PlacesSidebarView()
}
