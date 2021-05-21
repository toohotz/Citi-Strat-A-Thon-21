//
//  GamePlanTableViewCell.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/21/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

class GamePlanTableViewCell: UITableViewCell {

    var didSelectCell: Bool = false {
        didSet {
            if self.didSelectCell {
                contentView.subviews.forEach {
                    if let label = $0 as? UILabel {
                        label.textColor = .white
                    }
                }
                contentView.backgroundColor = UIColor(red: 0/255, green: 111/255, blue: 18/255, alpha: 1)
                iconImageView.image = iconImageView.image?.withTintColor(.white)
                chevron.image = UIImage(named: "checkmark.png")
            } else {
                titleLabel.textColor = .citiBlue
                
            }
        }
    }
    
    @IBOutlet weak var chevron: UIImageView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setupWith(_ title: String, subtitle: String, icon: UIImage) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        iconImageView.image = icon
    }
}
