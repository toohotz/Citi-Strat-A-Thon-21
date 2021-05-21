//
//  AccountInfoCell.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/20/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

class AccountInfoHeaderView: UITableViewHeaderFooterView {
    let title = UILabel() ~> {
        $0.font = .interstate(withStyle: .bold, ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
        
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AccountInfoCell: UITableViewCell {
    
    private let nameLabel = UILabel()~>{
        $0.font = .interstate(withStyle: .bold, ofSize: 16)
    }
    
    private let redactedAccountNumberLabel = UILabel()~>{
        $0.font = .interstate(withStyle: .light, ofSize: 16)
    }
    
    private let balanceLabel = UILabel()~>{
        $0.font = .interstate(withStyle: .bold, ofSize: 16)
    }
    
    private let accountTypeLabel = UILabel()~>{
        $0.font = .interstate(withStyle: .light, ofSize: 16)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUi() {
        
        nameLabel.textColor = .citiBlue
        redactedAccountNumberLabel.textColor = .secondaryLabel
        balanceLabel.textColor = .primaryLabel
        accountTypeLabel.textColor = .secondaryLabel
        
        contentView.addSubviews(nameLabel, redactedAccountNumberLabel, balanceLabel, accountTypeLabel)
        contentView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false

        }
        setupContraints()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            redactedAccountNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            redactedAccountNumberLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            redactedAccountNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11),
            
            balanceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            balanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            accountTypeLabel.topAnchor.constraint(equalTo: redactedAccountNumberLabel.topAnchor),
            accountTypeLabel.trailingAnchor.constraint(equalTo: balanceLabel.trailingAnchor),
            accountTypeLabel.bottomAnchor.constraint(equalTo: redactedAccountNumberLabel.bottomAnchor)
        ])
    }
    
    func setupWith(_ account: AccountInfo) {
        nameLabel.text = account.name
        redactedAccountNumberLabel.text = account.redactedAccountNumber
        balanceLabel.text = NumberFormatter.currencyFormatter.string(from: NSNumber(value: account.balance))
        accountTypeLabel.text = account.type.rawValue
    }
}
