//
//  RequestConfig.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

enum RequestConfig {
    
    case searchRequest(String)
    
    var value: Request? {
        
        switch self {
            
        case .searchRequest(let searchText):
            let urlString = String(format: Constants.searchURL, searchText)
            let reqConfig = Request.init(requestMethod: .get, urlString: urlString)
            return reqConfig
        }
    }
}
