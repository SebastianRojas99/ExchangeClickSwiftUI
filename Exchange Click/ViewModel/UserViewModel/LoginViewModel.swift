//
//  LoginViewModel.swift
//  Exchange Click
//
//  Created by Sebastian Marquez Rojas on 25/03/2024.
//

import SwiftUI

class LoginViewModel:ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    
    func login(){
        let loginData = Login(email: email, password: password)
    }

}

