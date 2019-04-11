//
//  LoginViewController.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit
import Alamofire

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
        self.setupLayout()
    }
    
    /**
     * Method to make the POST request inside API and return a response in case of success
     * The user and password values will be catched from user and password TextField
     */
    @IBAction func actionRequestLogin(_ sender: Any) {
        let params = ["user" : "test_user", "password" : "Test@1"]
        
        Alamofire.request("https://bank-app-test.herokuapp.com/api/login", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON(completionHandler: {
            response in
                switch response.result {
                    case .success(_):
                        do {
                            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                            
                            self.present(ExtractViewController(loginResponse: loginResponse), animated: true, completion: nil)
                        } catch (let error) {
                            print(error)
                    }
                    
                    case .failure(let error):
                        print(error)
                }
        })
    }
}

extension LoginViewController {
    /** Method to apply styles inside login button following the layout definition */
    func setupLayout() {
        buttonLogin.layer.cornerRadius = 4
        buttonLogin.layer.shadowColor = #colorLiteral(red: 0.231372549, green: 0.2823529412, blue: 0.9333333333, alpha: 1)
        buttonLogin.layer.shadowOffset = CGSize(width: 0, height: 3)
        buttonLogin.layer.shadowRadius = 4
        buttonLogin.layer.shadowOpacity = 0.3
    }
}
