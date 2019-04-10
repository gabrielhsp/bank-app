//
//  ExtractViewController.swift
//  BankApp
//
//  Created by Gabriel Henrique Santos Pereira on 10/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ExtractViewController: UIViewController {
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var buttonLogout: UIButton!
    @IBOutlet weak var labelAgencyAndAccount: UILabel!
    @IBOutlet weak var labelAccountBalance: UILabel!
    @IBOutlet weak var tableViewExtract: UITableView!
    
    init() {
        super.init(nibName: "ExtractViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        
        self.tableViewExtract.delegate = self
        self.tableViewExtract.dataSource = self
        self.tableViewExtract.register(ExtractItemTableViewCell.instanceOfNib(), forCellReuseIdentifier: ExtractItemTableViewCell.identifier)
    }
    
    /** Method to change the style of status bar to use lighten color */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /** Method to apply styles inside table view cell */
    func setupLayout() {
        self.tableViewExtract.rowHeight = UITableView.automaticDimension
        self.tableViewExtract.estimatedRowHeight = 80
        self.tableViewExtract.separatorStyle = .none
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
        return 10
    }
    
    /** Method that register the TableViewCell that will be used inside the TableView */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtractItemTableViewCell", for: indexPath) as! ExtractItemTableViewCell
        
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
}
