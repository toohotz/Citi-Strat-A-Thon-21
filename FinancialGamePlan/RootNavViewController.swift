//
//  RootNavViewController.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/20/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

class RootNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil), animated: false)
    }
}
