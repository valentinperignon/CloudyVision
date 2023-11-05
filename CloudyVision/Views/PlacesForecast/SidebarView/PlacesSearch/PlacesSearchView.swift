//
//  PlacesSearchView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CoreVisionKit
import MapKit
import SwiftUI

extension MKLocalSearchCompletion: Identifiable {
    public var id: Int {
        title.hashValue ^ subtitle.hashValue
    }
}

struct PlacesSearchView: View {
    @Environment(\.dismissSearch) private var dismissSearch

    var appModel: CloudyVisionModel
    var placeSearcher: PlaceSearcher

    var body: some View {
        List(placeSearcher.results) { result in
            Button {
                withAnimation {
                    appModel.selectedPlace = Place(from: result)
                    dismissSearch()
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
    PlacesSearchView(appModel: CloudyVisionModel(), placeSearcher: PlaceSearcher())
}
