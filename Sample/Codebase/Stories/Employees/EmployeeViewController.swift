//
//  EmployeeViewController.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

class EmployeeViewController: BaseViewController<EmployeeViewModel> {

    // MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private lazy var tableDataSource: UITableViewDataSource = {
        EmployeeTableDataSource(viewModel: viewModel)
    }()
    private lazy var tableDelegate: UITableViewDelegate = {
        EmployeeTableDelegate(viewModel: viewModel)
    }()

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    override func bindUIWithViewModel() {
        super.bindUIWithViewModel()
        
        viewModel.didInvalidateData = {
            [weak self]  in
            
            guard let sSelf = self else { return }
            
            sSelf.tableView.reloadData()
        }
    }

}

// MARK: - Private

private extension EmployeeViewController {
    
    private func setupTableView() {
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDelegate
        
        //tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "EmployeeCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
}
