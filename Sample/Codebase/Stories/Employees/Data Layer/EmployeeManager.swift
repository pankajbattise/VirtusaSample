//
//  EmployeeManager.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

class EmployeeManager {
    
    private let client = EmployeeClient(manager: Network.shared)
    
    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
       
        client.fetchEmployees() {
           (result) in
            
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success((response)))
            }
        }
    }
    
}


