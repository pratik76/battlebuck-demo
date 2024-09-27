//
//  ProjectEndPoint.swift
//  battlebuck demo
//
//  Created by Pratik Choudhary on 27/09/24.
//

import Foundation
enum EndPoint {
    case imagesData // Module - GET
}

extension EndPoint: EndPointType {


    var url: URL? {
        switch self {
        case .imagesData:
            return URL(string: "\(Constant.API.imageURL)")
        }
    }
    
    var method: HTTPMethods {
        switch self {
        case .imagesData:
            return .get
        }
    }
    
    var body: Encodable? {
        switch self {
        case .imagesData:
            return nil
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeaders
    }
}
