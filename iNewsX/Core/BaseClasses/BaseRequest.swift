//
//  BaseRequest.swift
//  iNewsX
//
//  Created by Shreya Bhatia on 05/07/22.
//

import Foundation

public enum Methods: String {
    case GET, POST, PUT, DELETE, PATCH, MOCK, QUERY, MUTATION
}

public class BaseRequest {
    
    public var url: String
    public var body: [String: AnyObject]?
    public var method: Methods
    public var header: [String: String]?
    
    public init(url: String, body: [String: AnyObject]?, method: Methods, header: [String: String]?) {
        self.url = url
        self.body = body
        self.method = method
        self.header = header
    }
}
