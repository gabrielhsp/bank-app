//
//  ExtractViewController.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit
import Alamofire

class ExtractViewController: UIViewController {
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var buttonLogout: UIButton!
    @IBOutlet weak var labelAgencyAndAccount: UILabel!
    @IBOutlet weak var labelAccountBalance: UILabel!
    @IBOutlet weak var tableViewExtract: UITableView!
    
    private var loginResponse: LoginResponse
    private var extractList: [Extract]?
    
    init(loginResponse: LoginResponse) {
        self.loginResponse = loginResponse
        super.init(nibName: "ExtractViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.loginResponse = LoginResponse()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelagateAndDataSource()
        self.returnExtractList()
        self.setAccountInformations()
    }
}

/** Extension to attribute the Delegate, DataSource and register the TableViewCell */
extension ExtractViewController {
    func setDelagateAndDataSource() {
        self.tableViewExtract.delegate = self
        self.tableViewExtract.dataSource = self
        self.tableViewExtract.register(ExtractItemTableViewCell.instanceOfNib(), forCellReuseIdentifier: ExtractItemTableViewCell.identifier)
    }
}

/** Extension to set user account informations inside each label */
extension ExtractViewController {
    func setAccountInformations() {
        self.labelUserName.text = loginResponse.userAccount?.name
        self.labelAgencyAndAccount.text = "\(loginResponse.userAccount?.account ?? "Não tem agência") / \(loginResponse.userAccount?.agency ?? "Não tem conta")"
        self.labelAccountBalance.text = String(format: "R$ %.02f", loginResponse.userAccount?.balance ?? 0)
    }
}

/** Extension to make a request to the API of statements and render inside a TableView a list of items */
extension ExtractViewController {
    func returnExtractList() -> Void {
        guard let userIdentifier = self.loginResponse.userAccount?.id else { return }
        
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/\(userIdentifier)").responseJSON(completionHandler: { response in
            switch response.result {
                case .success(_):
                    do {
                        let extractList = try JSONDecoder().decode(ExtractList.self, from: response.data!)
                        self.extractList = extractList.extractList
                        self.tableViewExtract.reloadData()
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print(error)
            }
        })
    }
}

/** Extension to apply styles inside ViewController and TableViewCell */
extension ExtractViewController {
    /** Method to change the style of status bar to use lighten color */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

/** Extension of ExtractViewController to implement the Delegate and DataSource protocols of TableView */
extension ExtractViewController: UITableViewDelegate, UITableViewDataSource {
    /** Method that determinates the number of sections inside our TableView */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /** Method that determinates the number of itens inside section of our TableView */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    /** Method that register the TableViewCell that will be used inside the TableView */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtractItemTableViewCell", for: indexPath) as! ExtractItemTableViewCell
        
        if let extract = extractList {
            cell.setDataToTableViewCell(extract: extract[indexPath.row])
        }
        
        return cell
    }
    
    /** Method to style the header and footer of our TableView */
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1)
            headerView.textLabel?.textColor = #colorLiteral(red: 0.2823529412, green: 0.3294117647, blue: 0.3960784314, alpha: 1)
            headerView.textLabel?.font = UIFont(name: "SFUIDisplay-Light", size: 17)
        }
    }
    
    /** Method to change the title of our TableView inside header section */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
