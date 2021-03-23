//
//  MyData.swift
//  CoreData-V2
//
//  Created by Shaik abdul mazeed on 22/03/21.
//

import Foundation
import CoreData
struct MyData : Codable {
    var id : Int
    var name : String
    var username : String
    var company : Company
    
    
}
struct Company: Codable {
    var name: String
}

