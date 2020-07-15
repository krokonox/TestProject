//
//  FillterViewController.swift
//  TestProject
//
//  Created by Admin on 15/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class FillterViewController: UIViewController {

    private var age: String = ""
    private var gender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func ascButtonClicked(_ sender: Any) {
        self.age = "asc"
    }
    
    @IBAction func descButtonClicked(_ sender: Any) {
        self.age = "desc"
    }
    
    @IBAction func femaleButtonClicked(_ sender: Any) {
        self.gender = "Female"
    }
    
    @IBAction func maleButtonClicked(_ sender: Any) {
        self.gender = "Male"
    }
    
    @IBAction func resetAllButtonClicked(_ sender: Any) {
        self.age = ""
        self.gender = ""
    }
    
    @IBAction func applyButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: .didApplyFilter, object: nil, userInfo: ["details" : ["age" : self.age, "gender" : self.gender]])
        self.navigationController?.popViewController(animated: true)
    }
    
}
