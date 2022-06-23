//
//  EmployeeModel.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

struct Employee: Codable {
    let id: String
    let name: String
    let salary: String
    let age: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
    }
    
}
