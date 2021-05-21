//
//  GamePlanViewController.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/21/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

class GamePlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    enum Section: String, CaseIterable {
        case connectAccounts
        case spendingCategories
        case emergencyFund
        case spendingInsights
        
        
        var title: String {
            switch self {
            case .connectAccounts: return "Connect Your Accounts"
            case .spendingCategories: return "Customize Your Spending Categories"
            case .emergencyFund: return "Start an Emergency Fund"
            case .spendingInsights: return "Enroll in Spending Insights"
            }
        }
        
        var subtitle: String {
            switch self {
            case .connectAccounts: return "Link everything in one place for a full financial picture."
            case .spendingCategories: return "Link everything in one place for a full financial picture."
            case .emergencyFund: return "Did you know that only 1/3 of Americans have an emergency savings account?"
            case .spendingInsights: return "Take control of your money when you sign up for important updates and alerts on your spending habits."
            }
        }
        
        var icon: UIImage {
            switch self {
            case .connectAccounts: return UIImage(named: "connectAccount.png")!
            case .spendingCategories: return UIImage(named: "money.png")!
            case .emergencyFund: return UIImage(named: "saving.png")!
            case .spendingInsights: return UIImage(named: "insights.png")!
            }
        }
    }
    
    private var completedItems: [Section] = [.spendingCategories, .emergencyFund, .spendingInsights, .connectAccounts]
    
    private var completedFlow = false
    @IBOutlet private weak var gamePlanView: UIView!
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Citi® Financial Game Plan"
        navigationItem.hidesBackButton = false
        
        gamePlanView.roundCorners(corners: [.topRight, .bottomRight], radius: 15)
        
        tableView.sectionHeaderHeight = 4
        tableView.sectionFooterHeight = 4
        tableView.register(UINib(nibName: String(describing: GamePlanTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GamePlanTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GamePlanTableViewCell.self), for: indexPath) as! GamePlanTableViewCell
        let item = !completedFlow ? Section.allCases[indexPath.section] : completedItems[indexPath.section]
        cell.setupWith(item.title, subtitle: item.subtitle, icon: item.icon)
        if completedFlow && item.title == Section.connectAccounts.title {
            cell.didSelectCell = true
            completedFlow = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let cell = tableView.cellForRow(at: indexPath) as! GamePlanTableViewCell
            
            cell.didSelectCell = true
            completedFlow = true
             
            tableView.beginUpdates()
            tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .automatic)
            tableView.endUpdates()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let vc = storyboard.instantiateViewController(identifier: String(describing: SpendingSummaryInitialViewController.self))
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
