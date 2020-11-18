//
//  SearchService.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

class SearchService: NSObject {
    
    /// - Parameters:
    ///   - text: search term
    ///   - completion: completion handler to retrieve result
    
    func request(_ searchText: String, completion: @escaping (Result<SearchResults?>) -> Void) {
        
        guard let request = RequestConfig.searchRequest(searchText).value else {
            return
        }
        
        NetworkManager.shared.request(request) { (result) in
            switch result {
            case .Success(let responseData):
                if let model = self.processResponse(responseData) {
                    if let stat = model.request_cached, stat == true {
                        
                        return completion(.Success(model))
                        
                    } else {
                        return completion(.Failure(NetworkManager.errorMessage))
                    }
                } else {
                    return completion(.Failure(NetworkManager.errorMessage))
                }
            case .Failure(let message):
                return completion(.Failure(message))
            case .Error(let error):
                return completion(.Failure(error))
            }
        }
    }
    
    func processResponse(_ data: Data) -> SearchResults? {
        do {
            let responseModel = try JSONDecoder().decode(SearchResults.self, from: data)
            return responseModel
            
        } catch {
            print("Data parsing error: \(error)")
            return nil
        }
    }
}
