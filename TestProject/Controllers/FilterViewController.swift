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
        var data = ["age" : "desc", "gender" : "male"]
        if ageSwitch.isOn {
            data["age"] = "asc"
        }
        if genderSwitch.isOn {
            data["gender"] = "female"
        }
        
        NotificationCenter.default.post(name: .didApplyFilter, object: nil, userInfo: data)
    }
}

