//
//  RestNetworkManager.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

class RestNetworkManager: NSObject, INetworkManager, URLSessionDelegate {
    
    func executeNetworkRequest<T: Codable>(_ type: T.Type, request: BaseRequest, completion: TaskCompletionHandler<T>?) {
        
        do {
            let urlRequest = try self.createURLRequest(request: request)
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
            let task = session.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else {
                    DispatchQueue.main.async {
                        completion?(.failure(BaseErrorClass(message: error!.localizedDescription)))
                    }
                    return
                }
                // Conversion
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion?(.failure(BaseErrorClass(message: "Data not found")))
                    }
                    return
                }
                
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    if statusCode >= 400 {
                        DispatchQueue.main.async {
                            completion?(.failure(BaseErrorClass(message: "Network error with status code: \(statusCode)")))
                        return
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    do {
                        let model = try JSONDecoder().decode(type, from: data)
                        completion?(.success(model))
                    } catch {
                        completion?(.failure(BaseErrorClass(message: error.localizedDescription)))
                    }
                }
                
            }
            task.resume()
            
        } catch {
            DispatchQueue.main.async {
                completion?(.failure(BaseErrorClass(message: error.localizedDescription)))
            }
        }
        
        
    }
    
    func createURLRequest(request: BaseRequest) throws -> URLRequest {
        
        guard let url = URL(string: request.url) else {
            throw BaseErrorClass(message: "Failed to get URL")
        }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = request.method.rawValue
        
        if let body = request.body {
            do {
                let bodyData = try JSONSerialization.data(withJSONObject: body, options: [.prettyPrinted])
                urlRequest.httpBody = bodyData
            } catch {
                throw BaseErrorClass(message: error.localizedDescription)
            }
        }
    
        request.header?.forEach({ key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })
    
        return urlRequest
    }
    
    override init() {}
    
}
