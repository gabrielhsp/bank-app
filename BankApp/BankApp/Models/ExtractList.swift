//
//  ExtractList.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 11/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

struct ExtractList: Codable {
    var extractList: [Extract]
    
    private enum CodingKeys: String, CodingKey {
        case extractList = "statementList"
    }
}
