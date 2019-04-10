//
//  LoginViewController.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet private weak var textFieldUser: UITextField!
    @IBOutlet private weak var textFieldPassword: UITextField!
    @IBOutlet private weak var buttonLogin: UIButton!
    
    init() {
        super.init(nibName: "LoginViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyStylesToButton()
    }
    
    /**
     * Method to apply styles inside login button following the layout definition
     */
    func applyStylesToButton() {
        buttonLogin.layer.cornerRadius = 4
        buttonLogin.layer.shadowColor = #colorLiteral(red: 0.231372549, green: 0.2823529412, blue: 0.9333333333, alpha: 1)
        buttonLogin.layer.shadowOffset = CGSize(width: 0, height: 3)
        buttonLogin.layer.shadowRadius = 4
        buttonLogin.layer.shadowOpacity = 0.3
    }
}
