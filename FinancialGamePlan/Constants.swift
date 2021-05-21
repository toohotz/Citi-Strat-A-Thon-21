//
//  Constants.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/20/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let citiBlue = UIColor(red: 0, green: 112/255, blue: 174/255, alpha: 1)
    
    static let primaryLabel = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    
    static let secondaryLabel = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
}

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

infix operator ~>

@discardableResult public func ~><T>(items: T, _configure: (inout T) throws -> Void) rethrows -> T{
    var copy = items
    try _configure(&copy)
    return copy
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
