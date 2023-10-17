//
//  SearchResultCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 16/10/2023.
//

import MapKit
import SwiftUI

struct SearchResultCell: View {
    let result: MKLocalSearchCompletion

    var body: some View {
        Button {
            // TODO: Select city
        } label: {
            VStack(alignment: .leading) {
                Text(highlightResult(from: result.title, ranges: result.titleHighlightRanges))
                    .font(.body)
                Text(highlightResult(from: result.subtitle, ranges: result.subtitleHighlightRanges))
                    .font(.caption)
            }
            .foregroundStyle(.secondary)
        }
    }

    private func highlightResult(from text: String, ranges: [NSValue]) -> AttributedString {
        var attributedString = AttributedString(text)
        for rangeValue in ranges {
            guard let nsRange = rangeValue as? NSRange,
                  let range = Range(nsRange, in: attributedString) else { continue }
            attributedString[range].foregroundColor = .primary
        }
        return attributedString
    }
}

#Preview {
    SearchResultCell(result: MKLocalSearchCompletion())
}
