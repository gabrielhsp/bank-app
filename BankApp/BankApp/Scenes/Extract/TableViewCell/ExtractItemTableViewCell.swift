//
//  ExtractItemTableViewCell.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ExtractItemTableViewCell: UITableViewCell {
    
    
    /** This is a static attribute to identify the .xib of our TableViewCell */
    static var identifier = "ExtractItemTableViewCell"
    
    /** This is the method that returns the instance of our NIB (.xib) to we recover inside another contexts */
    static func instanceOfNib() -> UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
