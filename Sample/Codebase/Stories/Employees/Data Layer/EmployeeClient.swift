//
//  EmployeeClient.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

class EmployeeClient: NetworkParser {
    
    private var factory: EmployeeRequestFactory {
        EmployeeRequestFactory(baseURL: manager.baseURL, token: UserSessionManager.shared.token)
    }
    
    let manager: NetworkLayer
    
    init(manager: NetworkLayer) {
        self.manager = manager
    }
    
    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
        manager.execute(factory.buildGetEmployees(), onSuccess: {
            [weak self] (data) in
            guard let sSelf = self else { return }
            
            do {
                completion(.success(try sSelf.decode(data)))
            } catch {
                completion(.failure(error))
            }
        }) {
            completion(.failure($0))
        }
    }

}

