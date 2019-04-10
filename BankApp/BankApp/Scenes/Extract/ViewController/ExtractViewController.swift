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
    
    init() {
        super.init(nibName: "ExtractViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /** Method to change the style of status bar to use lighten color */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func actionLogoutUser(_ sender: Any) {
    }
}
