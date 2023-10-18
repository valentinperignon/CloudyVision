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

    @Binding var selectedPlace: Place?

    var body: some View {
        List(placeSearcher.results, id: \.self) { result in
            Button {
                withAnimation {
                    placeSearcher.query = ""
                    selectedPlace = Place(from: result)
                }
            } label: {
                SearchResultCell(result: result)
            }
        }
        .overlay {
            if !placeSearcher.hasResults {
                ContentUnavailableView.search(text: placeSearcher.query)
            }
        }
        .onDisappear {
            placeSearcher.cancelSearch()
        }
    }
}

#Preview {
    PlacesSearchView(placeSearcher: PlaceSearcher(), selectedPlace: .constant(nil))
}
