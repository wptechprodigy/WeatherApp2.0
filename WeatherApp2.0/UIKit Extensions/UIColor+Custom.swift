//
//  UIColor+Custom.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//
// *******************************************************************************************
//
// → What's This File?
//   It's an extension. This is our custom color to be used with
//   the styles in the design.
//
//   Architectural Layer: Presentation Layer
//
// *******************************************************************************************
import UIKit

extension UIColor {

    // MARK: - Project based color

    enum WA {
        case primary

        var color: UIColor {
            switch self {
                case .primary:
                    return UIColor(red: 152/255, green: 12/255, blue: 128/255, alpha: 1.0)
            }
        }
    }
}
