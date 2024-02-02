//
//  WebService.swift
//  Created by Keval Gajjar on 02/02/24.
//

import Foundation
import Alamofire

enum WebServiceErrors: Error {
    case noDataFound
    case sessionExpired
}

enum APIEndpoints {
    case development
    case production
    case uat
    func getBaseURL() -> String {
        switch self {
        case .development:
            return ""
        case .production:
            return ""
        case .uat:
            return ""
        }
    }
    
    enum Path {
        case signIn
        case signUp
        case getProfile
        case forgotPassword
        
        func getPath() -> String {
            switch self {
            case .signIn:
                return ""
            case .signUp:
                return ""
            case .getProfile:
                return ""
            case .forgotPassword:
                return ""
            }
        }
    }
}

protocol APIRouteable: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    
}

extension APIRouteable {
    var baseURL: String { return  APIEndpoints.development.getBaseURL()}
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}

final class WebService : NSObject {
    let shared = WebService()
    weak var webDelegate : WebServiceDelegate? = nil
    
    func callingApi<Input: Encodable, Output: Decodable>(inputParams : Input, type: Output.Type, method: HTTPMethod = .get, headers : HTTPHeaders = [:]){
        if (Connectivity.isConnectedToNetwork()) {
            AF.request(APIEndpoints.development.getBaseURL(), method: method,
                       parameters: inputParams,
                       encoder: JSONParameterEncoder.default,
                       headers: headers).responseDecodable(of: Output.self, decoder: JSONDecoder()) { response in
                switch response.result {
                case .success(_):
                    self.webDelegate?.responseReceived(response: JSONDecoder(), error: WebServiceErrors.noDataFound)
                    break
                case .failure(let error): print(error)
                }
            }
        }
        else {
            // No network connection
        }
    }
    
    func encrypt(_ str: String, withPassword password: String) throws -> String {
        let encrypted = password + str + password
        return String(encrypted.reversed())
    }
}


protocol WebServiceDelegate: AnyObject {
    func responseReceived(response: JSONDecoder, error: Error)
}



