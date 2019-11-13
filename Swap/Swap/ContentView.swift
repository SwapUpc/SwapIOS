//
//  ContentView.swift
//  Swap
//
//  Created by Daniel Jimenez on 12/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import SwiftUI

struct InputTextField: View {
    
    @Binding var stateBinding: String
    
    let label: String
    let placeholder: String
    let secureTextField: Bool
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text(label).foregroundColor(Color.white)
            if secureTextField {
                SecureField(label,text: $stateBinding).padding(.vertical, 5).textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                TextField(placeholder,text: $stateBinding).padding(.vertical, 5).textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var manager = SwapServices()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Spacer()
            
            HStack {
                Spacer()
                Image("swap")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, 30)
                Spacer()
            }
            
            InputTextField(stateBinding: $email, label: "Email Address", placeholder: "Email Address", secureTextField: false)
            
            InputTextField(stateBinding: $password, label: "Password", placeholder: "Password", secureTextField: true)
            
            Button(action: {
                self.manager.logIn(email: self.email, password: self.password)
            }){
                HStack {
                    Spacer()
                    Text("Login")
                    .foregroundColor(Color(red: 52/255, green: 73/255, blue: 85/255))
                    .padding(.horizontal, 80)
                    .padding(.vertical, 10)
                    .background(Color(red: 249/255, green: 170/255, blue: 51/255))
                    .cornerRadius(4)
                    Spacer()
                }
            }.padding(.top, 15)
            Spacer()
        }
        .padding(.horizontal, 45)
        .background(Color(red: 52/255, green: 73/255, blue: 85/255))
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
