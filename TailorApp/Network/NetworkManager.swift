//
//  NetworkManager.swift
//  TailorApp
//
//  Created by Othman Alkous on 3/11/24.
//

import Foundation
import Alamofire
class NetworkManager {
    
    private let baseUrl = "http://localhost:8080/api/v1/"
        
        static let shared = NetworkManager()
    
    
    
    func signup(user: User, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
            let url = baseUrl + "auth/signup"
            AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let afError):
                    completion(.failure(afError as Error))
                }
            }
        }
        func signIn(username: String, password: String, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
            let url = baseUrl + "auth/signin"
            let parameters: [String: String] = ["username": username, "password": password]
            
            AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
                .responseDecodable(of: TokenResponse.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let afError):
                        completion(.failure(afError as Error))
                    }
                }
        }
}
