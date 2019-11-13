//
//  SignInRequest.swift
//  Swap
//
//  Created by Daniel Jimenez on 12/11/19.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation

struct SignInRequest : Decodable {
    let email: String
    let password: String
}
