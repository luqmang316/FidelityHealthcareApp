//
//  SearchResults.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

struct SearchResults: Decodable {
    
    let request_hash: String
    let request_cached: Bool?
    let request_cache_expiry: Int
    let results: [Results]
    let last_page: Int
    
}
