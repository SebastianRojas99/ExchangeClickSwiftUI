//
//  User.swift
//  Exchange Click
//
//  Created by Sebastian Marquez Rojas on 23/02/2024.
//

import Foundation


struct User:Decodable{
    let userId:UUID
    let name:String
    let lastName:String
    let email:String
    let username:String
    let subscriptionId:Int
    
}

struct Login:Codable{
    let email:String
    let password:String
}

struct Register {
    let user:User
    let password:String
}
struct TokenResponse: Decodable {
    let token: String
}





