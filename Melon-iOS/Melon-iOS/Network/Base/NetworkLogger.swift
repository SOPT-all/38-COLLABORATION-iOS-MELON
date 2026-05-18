//
//  NetworkLogger.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

import Foundation

final class NetworkLogger {
    
    static let shared = NetworkLogger()
    private init() {}
    
    static func requestLog(request: URLRequest) {
        print("\n🌈 Response 🌈")
        
        let url = request.url?.absoluteString ?? "URL None"
        let method = request.httpMethod
        
        var output = """
            url: \(url)
            method: \(String(describing: method))
            """
        
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            output += "\(key): \(value) \n"
        }
        
        if let body = request.httpBody {
            output += "\n \(String(data: body, encoding: .utf8) ?? "")"
        }
                
        print("\(output)\n")
    }
    
    static func responseLog(response: HTTPURLResponse?, data: Data?) {
        print("\n⛑️ Response ⛑️")
        
        var output = ""
        
        if let statusCode = response?.statusCode {
            output += "StatusCode: \(statusCode)"
        }
        
        if let body = data {
            output += "\n Body: \(String(data: body, encoding: .utf8) ?? "")"
        }
        
        print(output)
    }
}
