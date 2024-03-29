//
//  LoginView.swift
//  Exchange Click
//
//  Created by Sebastian Marquez Rojas on 25/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var login = LoginViewModel()
        var device = UIDevice.current.userInterfaceIdiom
           var body: some View {
               ZStack{
                   (LinearGradient(gradient: Gradient(colors: [.cyan,.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                   ).ignoresSafeArea(.all)
                   ZStack{
                       (LinearGradient(gradient: Gradient(colors: [.purple,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                       ).ignoresSafeArea(.all)
                       VStack(alignment: .center, spacing: 20)
                       {
                           Text("Exchange Click").font(.largeTitle).foregroundStyle(.white).bold().frame(alignment: .leading)
                           Spacer()
                           VStack{
                               TextField("Email", text: $email)
                                   .border(Color.white)
                                   .foregroundStyle(Color.black)
                                   .textFieldStyle(.roundedBorder)
                                   .keyboardType(.emailAddress)
                                   .textInputAutocapitalization(.never)
                                   .frame(width: device == .pad ? 400 : nil)
                               SecureField("Password", text: $password)
                                   .border(Color.white)
                                   .foregroundStyle(Color.black)
                                   .textFieldStyle(.roundedBorder)
                                   .frame(width: device == .pad ? 400 : nil)
                                   .padding(.bottom,20)
                               
                               Button(action:{
                                   login.login()
                               }){
                                   Text("Entrar")
                                       .font(.title)
                                       .frame(width: 200)
                                       .foregroundStyle(.white)
                                       .padding(.vertical,10)
                                       
                               }.background(Capsule().stroke(Color.white))
                                   
                           }.padding(.all)
                           
                           
                           
                       Spacer()
                       }
                   }
                   
               }
              
    }
}

#Preview {
    LoginView()
}
