//
//  RootViewController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    private var data: [Person] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicatorView.startAnimating()
        self.fetchData()
    }
    
    private func fetchData() {
        APIClient.sh.request() { [weak self] (data: [Person]?, error) in
            if let data = data {
                self?.data = data
                NotificationCenter.default.post(name: .didReceiveData, object: nil)
                DispatchQueue.main.async {
                    self?.indicatorView.stopAnimating()
                    let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                    
                    let initialViewController = appDelegate.storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                    appDelegate.window?.rootViewController = initialViewController
                    appDelegate.window?.makeKeyAndVisible()
                    initialViewController.setData(data: data)
                }
            } else {
                self?.alert(message: error?.description ?? "")
            }
        }
    }
}
