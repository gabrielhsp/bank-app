//
//  Extract.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 11/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

struct Extract: Codable {
    var title: String?
    var date: String?
    var category: String?
    var value: Double?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case date
        case category = "desc"
        case value
    }
}
