//
//  StyleSheet.swift
//  Style
//
//  Created by Kenny on 9/1/20.
//  Copyright © 2020 Apollo. All rights reserved.
//

import UIKit

// MARK: - Properties -

// MARK: - CGFloat + constants -
public extension CGFloat {
    static let cornerRadius: CGFloat = 8

}

// MARK: - UIColor + getColor -
public extension UIColor {
    ///these colors are in XCAssets
    enum ThemeColorName: String {
        case background
        case action
    }

    static func getColor(_ named: ThemeColorName) -> UIColor {
        UIColor(named: named.rawValue)!
    }

    static var background = getColor(.background)
    static var action = getColor(.action)
}

public class DefaultViewController: UIViewController {

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .background
    }

}
