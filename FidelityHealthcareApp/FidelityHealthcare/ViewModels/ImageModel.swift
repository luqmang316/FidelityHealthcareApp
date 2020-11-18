//
//  ImageModel.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

struct ImageModel {
    
    let imageURL: String
    
    init(withPhotos result: Results) {
        imageURL = result.image_url
    }
}
