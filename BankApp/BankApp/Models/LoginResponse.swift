//
//  UserResponse.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class LoginResponse: Codable {
    var userAccount: UserAccount?
    var error: Error?
}
