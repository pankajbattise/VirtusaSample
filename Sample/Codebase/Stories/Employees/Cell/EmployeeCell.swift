//
//  EmployeeCell.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

protocol EmployeeCellDisplayItem {
    var name: String { get }
    var salary: String { get}
    var age: String { get }
}

class EmployeeCell: UITableViewCell {
   
    // MARK: - Outlet
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSalary: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    
    // MARK: - Life Cyce
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
}

// MARK: - Public

extension EmployeeCell {
    
    func update(with item: EmployeeCellDisplayItem) {
        labelName.text = item.name
        labelSalary.text = item.salary
        labelAge.text = item.age
    }
    
}
