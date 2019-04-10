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
        self.applyStylesToTableView()
        
        self.tableViewExtract.delegate = self
        self.tableViewExtract.dataSource = self
        self.tableViewExtract.register(ExtractItemTableViewCell.instanceOfNib(), forCellReuseIdentifier: ExtractItemTableViewCell.identifier)
    }
    
    /** Method to change the style of status bar to use lighten color */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func applyStylesToTableView() {
        self.tableViewExtract.rowHeight = UITableView.automaticDimension
        self.tableViewExtract.estimatedRowHeight = 80
        self.tableViewExtract.separatorStyle = .none
    }
}

extension ExtractViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtractItemTableViewCell", for: indexPath) as! ExtractItemTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1)
            headerView.textLabel?.textColor = #colorLiteral(red: 0.2823529412, green: 0.3294117647, blue: 0.3960784314, alpha: 1)
            headerView.textLabel?.font = UIFont(name: "SFUIDisplay-Light", size: 17)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
}
