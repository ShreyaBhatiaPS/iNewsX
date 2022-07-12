//
//  RestNetworkManager.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

class RestNetworkManager: NSObject, INetworkManager {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func executeNetworkRequest<T: Codable>(_ type: T.Type, request: BaseRequest, completion: TaskCompletionHandler<T>?) {
        
        var urlRequest: URLRequest!
        do {
            urlRequest = try self.createURLRequest(request: request)
        } catch {
            DispatchQueue.main.async {
                completion?(.failure(BaseErrorClass(message: error.localizedDescription)))
            }
        }
        let task = session.dataTask(with: urlRequest) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(BaseErrorClass(message: error.localizedDescription)))
                } else {
                    do {
                        let model = try JSONDecoder().decode(type, from: data!)
                        completion?(.success(model))
                    } catch {
                        completion?(.failure(BaseErrorClass(message: error.localizedDescription)))
                    }
                }
            }
            
        }
        task.resume()
    }
    
    func createURLRequest(request: BaseRequest) throws -> URLRequest {
        
        guard let url = URL(string: request.url) else {
            throw BaseErrorClass(message: AppConstant.urlFailure)
        }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = request.method.rawValue
        
        if let body = request.body {
            do {
                let bodyData = try JSONSerialization.data(withJSONObject: body, options: [.prettyPrinted])
                urlRequest.httpBody = bodyData
            } catch {
                throw error
            }
        }
    
        request.header?.forEach({ key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })
    
        return urlRequest
    }
    
}
