//
//  Currency.swift
//  Exchange Click
//
//  Created by Sebastian Marquez Rojas on 24/02/2024.
//

import Foundation


struct Currency:Codable{
    let currencyId:Int
    let currencyName:String
    let currencySymbol:String
    let currencyValue:Decimal
}
