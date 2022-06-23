//
//  Network.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

class Network: NetworkLayer {
    
    enum Errors: Error {
        case apiError(statusCode: Int)
        case serverError(statusCode: Int)
        case badResponse
    }
    
    static let shared = Network()
    
    var session: URLSession
    
    init(_session: URLSession = .shared) {
        self.session = _session
    }
   
    // MARK: - NetworkLayer
    
    lazy var baseURL: URL = {
        URL(string: "https://raw.githubusercontent.com")
    }()!
    
    func execute(_ request: URLRequest, onSuccess: @escaping (Data) -> Void, onFailure: ((Error) -> Void)?) {
        
        #if DEBUG
        RequestResponseLogger.log(request: request)
        #endif
        
        session.dataTask(with: request) {
            (data, response , error) in
            
            guard let response = response as? HTTPURLResponse else { return }
            
            #if DEBUG
            RequestResponseLogger.log(data: data, response: response, error: error)
            #endif
            
            guard error == nil else {
                onFailure?(error!)
                return
            }
            
            let code = response.statusCode
            
            switch response.statusCode {
            case 200..<300:
                if let _data = data {
                    onSuccess(_data)
                } else {
                    onFailure?(Errors.apiError(statusCode: code))
                }
            case 400..<500:
                onFailure?(Errors.apiError(statusCode: code))
            default:
                onFailure?(Errors.serverError(statusCode: code))
            }
            
        }.resume()
    }
}

