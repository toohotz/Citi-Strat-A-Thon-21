//
//  SpendingSummaryInitialViewController.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/21/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

class SpendingSummaryInitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Citi® Financial Game Plan"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(identifier: String(describing: SpendingSummary25ViewController.self))
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
