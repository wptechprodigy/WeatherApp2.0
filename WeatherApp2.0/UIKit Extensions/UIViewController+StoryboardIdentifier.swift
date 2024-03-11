//
//  UIViewController+StoryboardIdentifier.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import UIKit

extension UIViewController {
    
    // MARK: - Static Properties
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
