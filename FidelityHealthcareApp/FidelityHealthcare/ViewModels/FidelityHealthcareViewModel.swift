//
//  FidelityHealthcareViewModel.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

class FidelityHealthcareViewModel: NSObject {

    private var searchText = ""
    public var dataSource = [SearchBusinessCellViewModel]()
        
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func search(text: String, completion:@escaping () -> Void) {
        
        searchText = text
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
                
        SearchService().request(searchText) {[weak self] (result) in
            guard let self = self else {return}
            GCD.runOnMainThread {
                
                switch result {
                case .Success(let results):
                    if let result = results {
                        self.dataSource = result.results.map{
                            SearchBusinessCellViewModel(result: $0)
                        }
                        self.dataUpdated?()
                        
                    }
                    completion()
                case .Failure(let message):
                    self.showAlert?(message)
                    completion()
                case .Error(let error):
                    self.showAlert?(error)
                    completion()
                }
            }
        }
    }
    
}
