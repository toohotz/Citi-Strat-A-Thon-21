//
//  FirstViewController.swift
//  FinancialGamePlan
//
//  Created by Kemar White on 5/20/21.
//  Copyright © 2021 Citi. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private enum Section: String, CaseIterable {
        case checking
        case gameplan
        case savings
        case creditCards
        
        var title: String {
            switch self {
            case .checking: return "CHECKING"
            case .gameplan: return ""
            case .savings: return "SAVINGS"
            case .creditCards: return "CREDIT CARDS"
            }
        }
        
        var items: [AccountInfo] {
            switch self {
            case .checking:
                return [AccountInfo.mockChecking]
            case .gameplan: return [AccountInfo.mockSavings]
            case .savings:
                return [AccountInfo.mockSavings]
            case .creditCards:
                return [AccountInfo.mockDoubleCash, AccountInfo.aaAdvantage]
            }
        }
    }
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)~>{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedSectionHeaderHeight = 140
        $0.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        $0.register(UINib(nibName: String(describing: GamePlanActionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GamePlanActionTableViewCell.self))
        $0.register(AccountInfoCell.self, forCellReuseIdentifier: String(describing: AccountInfoCell.self))
        $0.register(AccountInfoHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: AccountInfoHeaderView.self))
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupUi() {
        
        navigationController?.title = "Good evening, Zoia!"
        navigationController?.navigationItem.title = "Good evening, Zoia!"
        navigationItem.title = "Good evening, Zoia!"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSourceSection = Section.allCases[section]
        
        return dataSourceSection.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AccountInfoCell.self), for: indexPath) as! AccountInfoCell
        let dataSourceSection = Section.allCases[indexPath.section]
        if dataSourceSection == .gameplan {
            let gameplanTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: GamePlanActionTableViewCell.self), for: indexPath) as! GamePlanActionTableViewCell
            gameplanTableViewCell.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(displayGamePlanViewController)))
            return gameplanTableViewCell
        }
        cell.setupWith(dataSourceSection.items[indexPath.row])
        
        return cell
    }
    
    //MARK: - Tableview delegate methods
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dataSourceSection = Section.allCases[section]
        
        if dataSourceSection == .gameplan { return nil }
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: AccountInfoHeaderView.self)) as! AccountInfoHeaderView
        headerView.title.text = dataSourceSection.title
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @objc private func displayGamePlanViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        navigationController?.pushViewController(storyboard.instantiateViewController(identifier: String(describing: GamePlanViewController.self)), animated: true)
    }
}

