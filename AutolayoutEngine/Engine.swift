//  https://gist.github.com/amclv/d5a0d7ee7e6b037180ccdd4633ea8a5f
//  Autolayout Engine.swift
//  Style
//
//  Created by Aaron Cleveland (amclv)
//  Copyright © 2020 Apollo. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    enum ViewSize: CGFloat {
        case small = 30
        case medium = 60
        case large = 90
    }

    /// Autolayout initializer
    /// - Parameters:
    ///   - translatesAutoresizingMaskIntoConstraints: default false
    ///   - cornerRadius: default 8
    ///   - backgroundColor: default .action (for visibility)
    ///   - size: sets the UIView to the specified size (square)
    convenience init(translatesAutoresizingMaskIntoConstraints: Bool = false,
                     cornerRadius: CGFloat = .cornerRadius,
                     backgroundColor: UIColor = .action,
                     size: ViewSize? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        //appearance
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        //size
        if let size = size {
            setDimensions(width: size.rawValue, height: size.rawValue)
        }
    }

    /// Note: Left and right refer to left/right of screen or control.
    /// Leading/Trailing are affected by device locale (ie ltr/rtl language)

    /// Add Autolayout constraints to a view
    /// - Parameters:
    ///   - top: The anchor to constrain to this view's top anchor
    ///   - left: The anchor to constrain to this view's left anchor
    ///   - bottom: The anchor to constrain to this view's bottom anchor
    ///   - right: The anchor to constrain to this view's right anchor
    ///   - leading: The anchor to constrain to this view's leading anchor
    ///   - trailing: The anchor to constrain to this view's trailing anchor
    ///   - paddingTop: The amount of distance between this view's topAnchor and the constraint it's attached to
    ///   - paddingLeft: The amount of distance between this view's leftAnchor and the constraint it's attached to
    ///   - paddingBottom: The amount of distance between this view's bottomAnchor and the constraint it's attached to
    ///   - paddingRight: The amount of distance between this view's rightAnchor and the constraint it's attached to
    ///   - anchorLeading: The amount of distance between this view's leadingAnchor and the constraint it's attached to
    ///   - anchorTrailing: The amount of distance between this view's trailingAnchor and the constraint it's attached to
    ///   - width: The width of the view
    ///   - height: The height of the view
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                anchorLeading: CGFloat = 0,
                anchorTrailing: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: anchorLeading).isActive = true
        }

        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -anchorTrailing).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width {
            setWidth(width)
        }

        if let height = height {
            setHeight(height)
        }
    }

    /// Center a view in the designated view
    /// - Parameters:
    ///   - view: The view to be centered on
    func center(in view: UIView) {
        centerX(in: view)
        centerY(in: view)
    }

    /// Center a view horizontally in the designated view
    /// - Parameters:
    ///   - view: The view to be centered on
    func centerX(in view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func centerY(in view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setWidth(_ width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func setHeight(_ height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setDimensions(width: CGFloat, height: CGFloat) {
        setWidth(width)
        setHeight(height)
    }

    func addConstraintsToFillView(_ view: UIView) {
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
