//
//  RequestResponseLogger.swift
//  Sample
//
//  Created by Pankaj Battise on 21/06/22.
//

import Foundation

struct RequestResponseLogger {
    
    static func log(request: URLRequest){
        
        let urlString = request.url?.absoluteString ?? ""
        let components = NSURLComponents(string: urlString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod!)": ""
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        let host = "\(components?.host ?? "")"
        
        var requestLog = "\n---------- OUT - Request  ➡️\n"
        requestLog += "\(urlString)"
        requestLog += "\n\n"
        requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
        requestLog += "Host: \(host)\n"
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            requestLog += "\(key): \(value)\n"
        }
        if let body = request.httpBody{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "⚠️ Can't render body; not utf8 encoded";
            requestLog += "\n\(bodyString)\n"
        }
        
        requestLog += "\n------------------------- ➡️\n";
        print(requestLog)
    }
    
    static func log(data: Data?, response: HTTPURLResponse?, error: Error?){
        
        let urlString = response?.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        
        var responseLog = "\n⬅️ ---------- IN - Response \n"
        if let urlString = urlString {
            responseLog += "\(urlString)"
            responseLog += "\n\n"
        }
        
        if let statusCode =  response?.statusCode{
            responseLog += "HTTP \(statusCode) \(path)?\(query)\n"
        }
        if let host = components?.host{
            responseLog += "Host: \(host)\n"
        }
        for (key,value) in response?.allHeaderFields ?? [:] {
            responseLog += "\(key): \(value)\n"
        }
        if let body = data{
            let bodyString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "⚠️ Can't render body; not utf8 encoded";
            responseLog += "\n\(bodyString)\n"
        }
        if let error = error{
            responseLog += "\n⛔️ Error: \(error.localizedDescription)\n"
        }
        
        responseLog += "⬅️------------------------\n";
        print(responseLog)
    }
}

