//
//  WeatherSymbolView.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 25/10/2023.
//

import SwiftUI

struct WeatherSymbolView: View {
    let symbolName: String

    var body: some View {
        Image.safeSFSymbol(symbolName)
            .symbolRenderingMode(.multicolor)
    }
}

#Preview {
    WeatherSymbolView(symbolName: "cloud.heavyrain.fill")
}
