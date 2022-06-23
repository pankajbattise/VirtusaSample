//
//  EmployeeRequestFactory.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

struct EmployeeRequestFactory: SimpleRequesting {
    
    let baseURL: URL
    let token: String?
    
    // MARK: - Public
    
    func buildGetEmployees() -> URLRequest {
        let url = baseURL.appendingPathComponent("/johncodeos-blog/MVVMiOSExample/main/demo.json")
        
        return simpleGET(url: url, token: token)
        
    }
    
}

