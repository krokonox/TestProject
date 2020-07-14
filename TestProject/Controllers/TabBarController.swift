//
//  TabBarController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private var data: [Person] = []  {
        didSet {
            NotificationCenter.default.post(name: .didReceiveData,
                                            object: nil,
                                            userInfo: ["data" : data])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for viewController in self.viewControllers! {
            _ = viewController.view
        }
    }
    
    func setData(data: [Person]) {
        self.data = data
    }
}
