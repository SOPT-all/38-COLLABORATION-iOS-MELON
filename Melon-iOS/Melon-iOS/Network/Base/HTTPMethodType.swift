//
//  HTTPMethodType.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

enum HTTPMethodType {
    case get
    case post
    case patch
    
    var key: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        case .patch:
            "PATCH"
        }
    }
}

enum HeaderType {
    case auth
    case basic
    
    var value: [String: String] {
        switch self {
        case .auth:
            ["Content-Type": "application/json", "User-Id": "1"]
        case .basic:
            ["Content-Type": "application/json"]
        }
    }
}
