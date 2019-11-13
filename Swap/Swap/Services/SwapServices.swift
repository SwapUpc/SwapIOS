//
//  SwapServices.swift
//  Swap
//
//  Created by Daniel Jimenez on 12/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct SignInResponse : Decodable {
    let result: Int?
    let data: String?
    let message: String?
}

class SwapServices {
    private let baseUrl = "https://swaprest.azurewebsites.net/api"
    private let endPointSignIn = "/authentication/signin"
    
    private func AuthenticateString() -> String {
        return "\(baseUrl)\(endPointSignIn)"
    }
    
    func logIn(email: String, password: String){
        guard let url = URL(string: AuthenticateString()) else {
            fatalError("Invalid URL")
        }
        
        let body: [String: String] = ["email": email,"password": password]
        print(url)
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard let data = data else { return }
            let apiResponse = try! JSONDecoder().decode(SignInResponse.self, from: data)
            print(apiResponse.data)
        }.resume()
    }
}
