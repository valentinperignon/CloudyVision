//
//  PlaceSearcher.swift
//
//
//  Created by Valentin Perignon on 16/10/2023.
//

import Foundation
import MapKit

@Observable
public final class PlaceSearcher: NSObject {
    public var completer: MKLocalSearchCompleter

    private(set) public var results = [MKLocalSearchCompletion]()

    public var isSearching: Bool {
        return !completer.queryFragment.isEmpty
    }

    public var hasResults: Bool {
        return !results.isEmpty
    }

    public override init() {
        completer = MKLocalSearchCompleter()
        super.init()

        completer.delegate = self
    }
}

extension PlaceSearcher: MKLocalSearchCompleterDelegate {
    public func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        results = completer.results
    }
}
