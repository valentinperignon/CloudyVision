//
//  SearchResultCell.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 16/10/2023.
//

import SwiftUI

struct SearchResultCell: View {
    let title: String
    let subtitle: String

    var body: some View {
        Button {
            // TODO: Select city
        } label: {
            Text(verbatim: "\(title), \(subtitle)")
        }

    }
}

#Preview {
    SearchResultCell(title: "Paris", subtitle: "France")
}
