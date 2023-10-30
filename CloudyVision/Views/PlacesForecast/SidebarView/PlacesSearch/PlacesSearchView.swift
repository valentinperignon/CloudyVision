//
//  PlacesSearchView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 15/10/2023.
//

import CVCore
import MapKit
import SwiftUI

extension MKLocalSearchCompletion: Identifiable {
    public var id: Int {
        title.hashValue ^ subtitle.hashValue
    }
}

struct PlacesSearchView: View {
    @Environment(\.dismissSearch) private var dismissSearch

    var placeSearcher: PlaceSearcher
    var forecastModel: ForecastModel

    var body: some View {
        List(placeSearcher.results) { result in
            Button {
                withAnimation {
                    forecastModel.selectedPlace = Place(from: result)
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
    PlacesSearchView(placeSearcher: PlaceSearcher(), forecastModel: ForecastModel())
}
