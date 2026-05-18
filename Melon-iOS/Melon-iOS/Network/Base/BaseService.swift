//
//  BaseService.swift
//  Melon-iOS
//
//  Created by 이상엽 on 5/18/26.
//

import Foundation

final class BaseService {
    
    static let shared = BaseService()
    private init() {}
    
    func request<Response: Decodable>(
        endPoint: EndPoint,
        body: Encodable? = nil
    ) async throws -> Response {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        let url = baseURL + endPoint.url

        guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw NetworkError.urlError
        }
        
        guard let url = URL(string: encodedURL) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endPoint.requestType.key
        endPoint.header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body {
            let requestBody = try makeRequestBody(data: body)
            request.httpBody = requestBody
        }
        
        NetworkLogger.requestLog(request: request)
        
        return try await requestToResponse(request: request)
    }
}

extension BaseService {
    private func makeRequestBody<Body: Encodable>(data: Body) throws -> Data {
        do {
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            
            return requestBody
        } catch {
            throw NetworkError.requestEncodingError
        }
    }
    
    private func requestToResponse<Response: Decodable>(request: URLRequest) async throws -> Response {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.httpURLResponseError
        }
        
        NetworkLogger.responseLog(response: httpResponse, data: data)
        
        do {
            print("type\(Response.self)")
            let decoded = try JSONDecoder().decode(BaseResponseDTO<Response>.self, from: data)
            
            guard let data = decoded.data else {
                throw NetworkError.noData
            }
            
            guard (200...299).contains(decoded.status) else {
                throw NetworkError.serverErrorMessage(decoded.message)
            }
            
            return data
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
