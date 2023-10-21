//
//  ForecastView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 08/09/2023.
//

import CVCore
import SwiftUI

struct ForecastView: View {
    @Environment(\.modelContext) private var context

    @State private var isStored: Bool

    let place: Place

    init(place: Place) {
        self.place = place
        _isStored = State(wrappedValue: place.modelContext != nil)
    }

    var body: some View {
        VStack {
            
        }
        .padding()
        .navigationTitle(place.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if !place.isCurrentLocation {
                    if isStored {
                        Button {
                            withAnimation {
                                context.delete(place)
                                isStored = false
                            }
                        } label: {
                            Label("Remove this place from favorites", systemImage: "star.slash")
                        }
                    } else {
                        Button {
                            withAnimation {
                                context.insert(place)
                                isStored = true
                            }
                        } label: {
                            Label("Add this place to favorites", systemImage: "star")
                        }
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ForecastView(place: .appleCampus)
}
