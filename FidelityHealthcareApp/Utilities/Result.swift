//
//  Result.swift
//  FidelityHealthcareApp
//
//  Created by Muhammad Luqman on 11/18/20.
//

import UIKit

enum Result <T>{
    
    case Success(T)
    case Failure(String)
    case Error(String)
}
