//
//  ViewController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var ageSwitch: UISwitch!
    @IBOutlet weak var genderSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        var data = ["age" : "asc", "gender" : "Male"]
        if ageSwitch.isOn {
            data["age"] = "desc"
        }
        if genderSwitch.isOn {
            data["gender"] = "Female"
        }
      
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: .didApplyFilter, object: nil, userInfo: ["details" : data])
        }
    }
}

