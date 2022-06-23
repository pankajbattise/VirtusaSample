//
//  UserSessionManager.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

class UserSessionManager {
    
    // MARK: - Properties
    
    static let shared = UserSessionManager()
    
    private init() { }
    
    var token: String?
}
