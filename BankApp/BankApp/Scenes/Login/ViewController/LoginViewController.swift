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
        guard let userValue = textFieldUser.text else { return }
        guard let passwordValue = textFieldPassword.text else { return }
        
        let dataIsValid: Bool = self.validateLoginFields(user: userValue, password: passwordValue)
        let params = ["user" : userValue, "password" : passwordValue]
        
        if dataIsValid {
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
        } else {
            self.showCustomAlertMessage(title: "Usuário não encontrado", message: "Não conseguimos encontrar seu usuário.")
        }
    }
}

extension LoginViewController {
    func validateLoginFields(user: String, password: String) -> Bool {
        if valuesAreEmpty(user: user, password: password) && userLoginIsValid(user: user) && passwordIsValid(password: password) {
            return true
        }
        
        return false
    }
    
    func showCustomAlertMessage(title: String, message: String, confirmActionText: String = "Entendi", animated: Bool = true) {
        let customAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            customAlert.addAction(UIAlertAction(title: confirmActionText, style: .cancel, handler: nil))
        
        self.present(customAlert, animated: animated, completion: nil)
    }
    
    func valuesAreEmpty(user: String, password: String) -> Bool {
        if user.isEmpty && password.isEmpty {
            self.showCustomAlertMessage(title: "Dados inválidos", message: "Os campos não podem estar em branco.")
            return false
        }
        
        return true
    }
    
    func userLoginIsValid(user: String) -> Bool {
        if user.isValidCPF() || user.isValidEmail() {
            return true
        }
        
        self.showCustomAlertMessage(title: "CPF ou e-mail inválidos", message: "Os dados do seu CPF ou do seu e-mail estão incorretos.")
        
        return false
    }
    
    func passwordIsValid(password: String) -> Bool {
        if password.isValidPassword() {
            return true
        }
        
        self.showCustomAlertMessage(title: "Senha inválida", message: "A senha deve conter um caracter maiúsculo, um especial e um número.")
        
        return false
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
