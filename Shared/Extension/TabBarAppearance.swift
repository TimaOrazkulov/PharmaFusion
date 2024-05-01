//
//  TabBarAppearance.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import UIKit

extension UITabBarAppearance {
    static func customAppearance() -> UITabBarAppearance {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        // Set tab bar tint color (selected and unselected)
        appearance.backgroundColor = UIColor.white // Example: white background
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.init(hex: "543BD6") // Example: blue for selected
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.init(hex: "CCC1FF")  // Example: gray for unselected

        // Optional: Set other appearance properties like font, shadow, etc.

        return appearance
    }
}
