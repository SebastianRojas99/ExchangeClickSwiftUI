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
    @Published var token: String?
    
    func login() {
        // Construir la solicitud de inicio de sesión
        let loginData = Login(email: email, password: password)
        
        // Simulamos una solicitud de red utilizando URLSession
        guard let url = URL(string: "https://localhost:7043/api/Auth/authenticate") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(loginData)
        } catch {
            print("Error al codificar los datos de inicio de sesión: \(error.localizedDescription)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error de red: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                // Respuesta exitosa del servidor
                do {
                    // Parsear la respuesta para obtener el token JWT
                    let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.token = tokenResponse.token
                        
                    }
                } catch {
                    print("Error al decodificar la respuesta del servidor: \(error.localizedDescription)")
                }
            } else {
                print("Respuesta del servidor no válida")
            }
        }.resume()
    }
}
