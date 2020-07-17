//
//  FillterViewController.swift
//  TestProject
//
//  Created by Admin on 15/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    private var age: String = ""
    private var gender: String = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Functions
    
    @IBAction func ascButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            self.age = "asc"
        } else {
            self.age = ""
        }
    }
    
    @IBAction func descButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            self.age = "desc"
        } else {
            self.age = ""
        }
    }
    
    @IBAction func femaleButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            self.gender = "Female"
        } else {
            self.gender = ""
        }
    }
    
    @IBAction func maleButtonClicked(_ sender: UIButton) {
        if sender.isSelected {
            self.gender = "Male"
        } else {
            self.gender = ""
        }
    }
    
    @IBAction func resetAllButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: .didResetFilter, object: nil, userInfo: nil)
    }
    
    @IBAction func applyButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: .didApplyFilter, object: nil, userInfo: ["details" : ["age" : self.age, "gender" : self.gender]])
        self.navigationController?.popViewController(animated: true)
    }
    
}
