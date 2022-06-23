//
//  SimpleRequesting.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol URLRequestSimpleFactoring {
    
    func buildJSONContentTypeRequest(_ url: URL, method: HTTPRequestMethod) -> URLRequest
}

extension URLRequestSimpleFactoring {
    
    func buildJSONContentTypeRequest(_ url: URL, method: HTTPRequestMethod) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = method.rawValue
        
        return request
    }
}

protocol RequestTokenize {
    
    associatedtype RequestType
    
    func enhancingIfNeeded(token: String?) -> RequestType
}

extension URLRequest: RequestTokenize {
    
    func enhancingIfNeeded(token: String?) -> URLRequest {
        guard let _token = token else { return self }
        
        var request = self
        
        request.addValue("Bearer \(_token)", forHTTPHeaderField: "AuthorizationHeader")
        
        return request
    }
}

protocol SimpleRequesting: URLRequestSimpleFactoring {
    
    func simplePOST<ModelType: Encodable>(url: URL, token: String?, model: ModelType) -> URLRequest
    
    func simplePUT<ModelType: Encodable>(url: URL, token: String?, model: ModelType) -> URLRequest
    func simplePUT(url: URL, token: String?) -> URLRequest
    
    func simpleGET(url: URL, token: String?) -> URLRequest
    
    func simpleDelete<ModelType: Encodable>(url: URL, token: String?, model: ModelType) -> URLRequest
    
    func parameterizedGET(url: URL, token: String?, parameters: [String: String]) -> URLRequest
    func parameterizedGET(url: URL, token: String?, parameters: [String: [String]]) -> URLRequest
}

extension SimpleRequesting {
    
    func simplePOST<ModelType: Encodable>(url: URL, token: String? = nil, model: ModelType) -> URLRequest {
        var request = buildJSONContentTypeRequest(url, method: .post).enhancingIfNeeded(token: token)
        
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(model)
        request.httpBody = encoded
        
        return request
    }
    
    func simplePUT<ModelType: Encodable>(url: URL, token: String? = nil, model: ModelType) -> URLRequest {
        var request = buildJSONContentTypeRequest(url, method: .put).enhancingIfNeeded(token: token)
        
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(model)
        request.httpBody = encoded
        
        return request
    }
    
    func simpleGET(url: URL, token: String? = nil) -> URLRequest {
        buildJSONContentTypeRequest(url, method: .get).enhancingIfNeeded(token: token)
    }
    
    func simplePUT(url: URL, token: String? = nil) -> URLRequest {
        buildJSONContentTypeRequest(url, method: .put).enhancingIfNeeded(token: token)
    }
    
    func simpleDelete<ModelType: Encodable>(url: URL, token: String?, model: ModelType) -> URLRequest {
        var request = buildJSONContentTypeRequest(url, method: .delete).enhancingIfNeeded(token: token)
        
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(model)
        request.httpBody = encoded
        
        return request
    }
    
    func parameterizedGET(url: URL, token: String? = nil, parameters: [String: String]) -> URLRequest {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = parameters.enumerated().map {
            URLQueryItem(name: $1.key, value: $1.value)
        }
        
        guard let percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B") else {
            return URLRequest(url: components.url!)
        }
        
        components.percentEncodedQuery = percentEncodedQuery
        
        return simpleGET(url: components.url!, token: token)
    }
    
    func parameterizedPUT(url: URL, token: String? = nil, parameters: [String: String]) -> URLRequest {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = parameters.enumerated().map {
            URLQueryItem(name: $1.key, value: $1.value)
        }
        
        guard let percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B") else {
            return URLRequest(url: components.url!)
        }
        
        components.percentEncodedQuery = percentEncodedQuery
        
        return simplePUT(url: components.url!, token: token)
    }
    
    func parameterizedGET(url: URL, token: String? = nil, parameters: [String: [String]]) -> URLRequest {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = parameters.enumerated()
            .map {
                (offset, element) -> [URLQueryItem] in
                
                element.value.map { URLQueryItem(name: element.key, value: $0) }
        }.reduce([]) {
            (result, next) -> [URLQueryItem] in
            
            var buffer = result
            buffer.append(contentsOf: next)
            return buffer
        }
        
        guard let percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B") else {
            return URLRequest(url: components.url!)
        }
        
        components.percentEncodedQuery = percentEncodedQuery
        
        return simpleGET(url: components.url!, token: token)
    }
}

