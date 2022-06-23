//
//  NetworkParser.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

protocol NetworkParser {
    
    func decode<ResultType: Decodable>(_ response: Data) throws -> ResultType
}

extension NetworkParser {
    
    func decode<ResultType: Decodable>(_ response: Data) throws -> ResultType {
        try JSONDecoder.shared.decode(ResultType.self, from: response)
    }
}

extension JSONDecoder {
    
    static let shared = JSONDecoder()
}

