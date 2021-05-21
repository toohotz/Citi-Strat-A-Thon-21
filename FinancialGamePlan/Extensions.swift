//
//  Extensions.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/20/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Adds a set of views to the end of the receiver’s list of subviews.
    ///
    ///This method establishes a strong reference to view and sets its next responder to the receiver, which is its new superview.
    ///
    ///Views can have only one superview. If view already has a superview and that view is not the receiver, this method removes the previous superview before making the receiver its new superview.
    ///
    /// - Parameter views: The views to be added. Each view is added in the order that is it specified with the last view becoming the topmost view.  After being added, each view appears on top of any other subviews.
    public func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
