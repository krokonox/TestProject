//
//  TableViewController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var data: [Person] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private func configureTableView() {
        self.tableView.register(TableViewCell.nib(),
                                forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidFilterData(_:)), name: .didApplyFilter, object: nil)
        self.configureTableView()
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        if let data = notification.userInfo?["data"] as? [Person] {
            self.data = data
        }
    }
    @objc func onDidFilterData(_ notification: Notification) {
        if let parameters = notification.userInfo?["data"] as? [String : String] {
            self.data = Helper.filterData(with: data, parameters: parameters)
           }
       }
    
    @IBAction func buttonClicked(_ sender: Any) {
      //  self.pushViewController(FilterViewController(), animated: true)
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = data[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier)
        
        if let cell = cell as? TableViewCell {
            cell.configure(with: person.last_name,
                           age: String(person.age),
                           gender: person.gender)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
