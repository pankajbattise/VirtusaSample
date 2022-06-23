//
//  EmployeeAssembly.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import UIKit

struct EmployeeAssembly {
    
    static func build() -> UIViewController {
        let b = Bundle(for: EmployeeViewController.self)
        let sb = UIStoryboard(name: "Employee", bundle: b)
        let c = sb.instantiateInitialViewController() as! EmployeeViewController
        let vm = EmployeeViewModel()
        c.viewModel = vm
        
        return c
    }
}

