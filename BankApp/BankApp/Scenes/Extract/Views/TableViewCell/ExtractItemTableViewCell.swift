//
//  ExtractItemTableViewCell.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ExtractItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var labelTransactionCategory: UILabel!
    @IBOutlet private weak var labelTransactionDate: UILabel!
    @IBOutlet private weak var labelTransactionTitle: UILabel!
    @IBOutlet private weak var labelTransactionValue: UILabel!
    @IBOutlet weak var viewTransactionContainer: UIView!
    
    /** This is a static attribute to identify the .xib of our TableViewCell */
    static var identifier = "ExtractItemTableViewCell"
    
    /** This is the method that returns the instance of our NIB (.xib) to we recover inside another contexts */
    static func instanceOfNib() -> UINib {
        return UINib(nibName: identifier, bundle: Bundle.main)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ExtractItemTableViewCell {
    func setDataToTableViewCell(extract: Extract) {
        self.labelTransactionCategory.text = extract.category
        self.labelTransactionDate.text = extract.date
        self.labelTransactionTitle.text = extract.title
        self.labelTransactionValue.text = String(format: "R$ %.02f", extract.value ?? 0)
    }
}

/** Extension to setup layout of extract item card */
extension ExtractItemTableViewCell {
    func setupLayout() {
        viewTransactionContainer.layer.cornerRadius = 6
        
        viewTransactionContainer.layer.borderWidth = 1
        viewTransactionContainer.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8745098039, blue: 0.8901960784, alpha: 0.3)
        
        viewTransactionContainer.layer.shadowColor = #colorLiteral(red: 0.8509803922, green: 0.8862745098, blue: 0.9137254902, alpha: 1)
        viewTransactionContainer.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewTransactionContainer.layer.shadowOpacity = 0.5
    }
}
