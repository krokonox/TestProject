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
        
        let tableVC = self.storyboard!.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        _ = tableVC.view
        let collectionVC = self.storyboard!.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        _ = collectionVC.view
        
        let tableController = self.createNavigationController(tableVC, title: "table")
        let collectionController = self.createNavigationController(collectionVC, title: "collection")
        
        self.viewControllers = [tableController, collectionController]
        
    }
    
    private func createNavigationController(_ viewController: UIViewController, title: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: title)
        return navController
    }
    
    func setData(data: [Person]) {
        self.data = data
    }
}
