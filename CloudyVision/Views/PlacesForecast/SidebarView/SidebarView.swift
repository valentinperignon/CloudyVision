//
//  SidebarView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import SwiftUI

struct SidebarView: View {
    @State private var search = ""

    var body: some View {
        Group {
            if search.isEmpty {
                PlacesListView()
            } else {
                PlacesSearchView(search: search)
            }
        }
        .navigationTitle("Weather")
        .searchable(text: $search)
    }
}

#Preview {
    SidebarView()
}
