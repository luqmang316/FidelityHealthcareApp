//
//  Photos.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import Foundation

class Results: Decodable {
    
    var mal_id: Int
    var url: String
    var image_url: String
    
    var title: String
    var airing: Bool
    var synopsis: String
    var type: String
    var episodes: Int
    var score: Double
    var start_date: String?
    var end_date: String?
    var members: Int
    var rated: String?
}
