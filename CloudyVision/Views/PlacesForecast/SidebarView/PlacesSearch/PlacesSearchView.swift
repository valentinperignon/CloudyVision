//
//  PlacesSearchView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CVCore
import SwiftUI

struct PlacesSearchView: View {
    var placeSearcher: PlaceSearcher

    var body: some View {
        List(placeSearcher.results, id: \.self) { result in
            Text("\(result.title), \(result.subtitle)")
        }
        .overlay {
            if !placeSearcher.hasResults {
                ContentUnavailableView.search(text: placeSearcher.completer.queryFragment)
            }
        }
    }
}

#Preview {
    PlacesSearchView(placeSearcher: PlaceSearcher())
}
