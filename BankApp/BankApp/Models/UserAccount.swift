//
//  User.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class UserAccount: Codable {
    var id: Int = 0
    var name: String?
    var agency: String?
    var account: String?
    var balance: Double?
    
    private enum CodingKeys: String, CodingKey {
        case id = "userId"
        case name
        case agency
        case account = "bankAccount"
        case balance
    }
}
