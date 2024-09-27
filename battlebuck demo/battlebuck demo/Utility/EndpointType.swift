//
//  EndpointType.swift
//  battlebuck demo
//
//  Created by Pratik Choudhary on 27/09/24.
//

import Foundation
enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var url: URL? { get }
    var method: HTTPMethods { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}
