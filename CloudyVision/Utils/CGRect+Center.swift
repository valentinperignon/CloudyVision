//
//  CGRect+Center.swift
//  CloudyVision
//
//  Created by Valentin Perignon on 17/09/2023.
//

import Foundation

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
