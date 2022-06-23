//
//  NetworkLayer.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

protocol NetworkLayer {
    
    var baseURL: URL { get }
    
    func execute(_ request: URLRequest, onSuccess: @escaping (Data) -> Void, onFailure: ((Error) -> Void)?)
}

