//
//  EmployeeTableDelegate.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

class EmployeeTableDelegate: NSObject, UITableViewDelegate {
    
    // MARK: - Properties
    
    private let viewModel: EmployeeViewModel
    
    // MARK: - Life cycle
    
    init(viewModel: EmployeeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - UITableViewDelegate
    

}

