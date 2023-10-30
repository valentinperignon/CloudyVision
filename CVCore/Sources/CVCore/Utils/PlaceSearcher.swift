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
    private var completer: MKLocalSearchCompleter

    public var query: String {
        get {
            access(keyPath: \.query)
            return completer.queryFragment
        }
        set {
            withMutation(keyPath: \.query) {
                completer.queryFragment = newValue
            }
        }
    }

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
        completer.resultTypes = .address
    }

    public func cancelSearch() {
        query = ""
        completer.cancel()
    }
}

extension PlaceSearcher: MKLocalSearchCompleterDelegate {
    public func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        results = completer.results
    }
}
