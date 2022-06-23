//
//  EmployeeTableDataSource.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

class EmployeeTableDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    private let viewModel: EmployeeViewModel
    
    // MARK: - Life cycle
    
    init(viewModel: EmployeeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeeCell
        
        cell.update(with: viewModel.itemForCell(at: indexPath))
        
        return cell
    }
}


