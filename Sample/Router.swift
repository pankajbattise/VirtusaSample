//
//  Router.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

struct Router: BaseRouting {
    
    func openEmployees() {
        let module = EmployeeAssembly.build()
        anyTopController?.present(module, animated: true)
    }
    
}

