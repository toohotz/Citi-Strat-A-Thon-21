//
//  AccountInfo.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/20/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import Foundation

struct AccountInfo {
    
    let name: String
    let redactedAccountNumber: String
    let balance: Double
    let type: AccountType
    
    static let mockSavings =
        AccountInfo(name: "Citi® Savings", redactedAccountNumber: "**** **** **** 2340", balance: 31_139.92, type: .banking)
    
    static let mockChecking =  AccountInfo(name: "Citi® Checking", redactedAccountNumber: "**** **** **** 1234", balance: 1_939.92, type: .banking)
    
    static let mockDoubleCash = AccountInfo(name: "Citi® Double Cash", redactedAccountNumber: "**** **** **** 1540", balance: 31_139.92, type: .credit)
    
    static let aaAdvantage = AccountInfo(name: "Citi® AAdvantage", redactedAccountNumber: "**** **** **** 3420", balance: 1_132.00, type: .credit)
    
}

enum AccountType: String {
    case banking = "Available Now"
    case credit = "Current Balance"
}
