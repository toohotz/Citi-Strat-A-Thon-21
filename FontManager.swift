//
//  FontManager.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/21/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import Foundation
import UIKit.UIFont

class InterstateFontConfigurator {
    static let fontName = "Interstate"
    
//    static var loaded
    
    static var loadedFonts = [UIFont.InterstateStyle: Bool]()
    
    @discardableResult class func loadFont(_ name: String) -> Bool {
        let bundle: Bundle
        if let _ = NSClassFromString("XCTest") {
            bundle = Bundle(for: type(of: InterstateFontConfigurator()))
        } else {
            bundle = Bundle(for: InterstateFontConfigurator.self)
        }
        guard let fontPath = bundle.path(forResource: name, ofType: "ttf"), let fontData = try? Data(contentsOf: URL(fileURLWithPath: fontPath)), let provider = CGDataProvider(data: fontData as CFData) else { return false }
        guard let font = CGFont(provider), let dashRange = name.range(of: "-"), let style = UIFont.InterstateStyle(rawValue: String(name[dashRange.upperBound...])) else { return false }
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        loadedFonts[style] = success
        
        if !success {
            print("Error loading font. Font is possibly already registered.")
            return false
        } else { return true }
    }
    
    /// Loads all the font styles for **OpenSans**.
    public class func configure() {
        UIFont.InterstateStyle.allCases.forEach {
            loadedFonts[$0] = InterstateFontConfigurator.loadFont("\(InterstateFontConfigurator.fontName)-\($0.rawValue)")
        }
    }
}

extension UIFont {
    enum InterstateStyle: String, CaseIterable {
        case bold = "bold"
        case light = "light"
        case regular = "regular"
    }
    
    static func scaledFont(from font: UIFont, usingFontMetric fontMetrics: UIFontMetrics? = nil) -> UIFont {
        guard let fontMetrics = fontMetrics else {
            return UIFontMetrics.default.scaledFont(for: font)
        }
        return fontMetrics.scaledFont(for: font)
    }
    
    @available(iOS 11, *)
    /// Scales the font for the default font metrics.
    public var scaled: UIFont {
        return UIFontMetrics.default.scaledFont(for: self)
    }
    
    /// Creates an **Interstate** styled font with a given size.  If no style is specified, the regular style will be used.
    ///
    /// - Parameters:
    ///   - style: The font style to be used.
    ///   - size: The size of the font
    /// - Returns: An **Interstate** styled font.
    class func interstate(withStyle style: InterstateStyle = .regular, ofSize size: CGFloat) -> UIFont {
        let isFontLoaded = InterstateFontConfigurator.loadedFonts[style] ?? false
        
        if !isFontLoaded {
            InterstateFontConfigurator.loadedFonts[style] = InterstateFontConfigurator.loadFont("\(InterstateFontConfigurator.fontName)-\(style.rawValue)")
        }
        if style == .regular {
            guard let regularFont = UIFont(name: InterstateFontConfigurator.fontName, size: 15) else { return UIFont.systemFont(ofSize: size) }
            return regularFont
        } else if let font = UIFont(name: "\(InterstateFontConfigurator.fontName)-\(style.rawValue)", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
        
    }
}
