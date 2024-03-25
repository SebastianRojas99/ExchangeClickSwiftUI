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
        guard let url = URL(string: "https://localhost:7043/api/Auth/authenticate")else{return}
        print("\(loginData)")
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            request.httpBody = try JSONEncoder().encode(loginData)
        }catch{
            return
        }
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let _ = data, error == nil else{
                return
            }
            
            
        }
    }

}

