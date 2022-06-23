//
//  EmployeeViewModel.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

class EmployeeViewModel: BaseViewModel {
    
    // MARK: - Definitions
    
    private struct EmployeeItem: EmployeeCellDisplayItem {
        var name: String
        var salary: String
        var age: String
    }

    // MARK: - Properties
    
    private var employees = [Employee]()
    private var manager = EmployeeManager()

    // MARK: - Bindings
    
    var didInvalidateData: (() -> Void)?
    var didUpdateSectionsAt: ((IndexSet) -> Void)?
    
    // MARK: - LifeCycle
    
    override func initialSetup() {
        super.initialSetup()
        
    }
    
    override func viewDidBindUIWithViewModel() {
        super.viewDidBindUIWithViewModel()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchEmployees()
    }
}

// MARK: - Public

extension EmployeeViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        employees.count
    }
    
    func itemForCell(at indexPath: IndexPath) -> EmployeeCellDisplayItem {
        let row = employees[indexPath.row]

        let item = EmployeeItem(name: row.name, salary: row.salary, age: row.age)
    
        return item
    }
    
}

// MARK: - Private

private extension EmployeeViewModel {
    
    func fetchEmployees() {
        manager.fetchEmployees {
            [weak self] result in
            
            guard let sSelf = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let employees):
                    sSelf.employees = employees
                    sSelf.didInvalidateData?()
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
