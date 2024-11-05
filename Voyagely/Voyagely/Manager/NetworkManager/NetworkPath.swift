//
//  NetworkPath.swift
//  Voyagely
//
//  Created by Engin Gülek on 5.11.2024.
//

import Foundation

public enum NetworkPath {
    case categories
    case nearBy(String)
    case detail(Int)
}


extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .categories:
            Constants.category.rawValue + Constants.getAll.rawValue
        case .nearBy(let city):
            Constants.place.rawValue + Constants.nearBy.rawValue + "?city=\(city)"
        case .detail(let id):
            Constants.place.rawValue + Constants.detail.rawValue + "?id=\(id)"
        }
        
    }
    
    var method: AlamofireMethod {
        switch self {
        default:
            return .GET
            
        }
    }
    
    var requestType: RequestType {
        switch self {
        default:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
