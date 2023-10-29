//
//  View+Extension.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 29/10/2023.
//

import Foundation
import SwiftUI

extension Image {
    static func safeSFSymbol(_ name: String) -> Image {
        let filledSymbol = "\(name).fill"
        if let _ = UIImage(systemName: filledSymbol) {
            return Image(systemName: filledSymbol)
        } else {
            return Image(systemName: name)
        }
    }
}
