//
//  SearchBusinessCellViewModel.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/20/20.
//

import Foundation

class SearchBusinessCellViewModel {
    
    let imageURL: String
    let title: String
    let type: String
    let synopsis: String
    
    init(result: Results) {
        
        self.imageURL = result.image_url
        self.title = result.title
        self.type = result.type
        self.synopsis = result.synopsis
    }
    
}
