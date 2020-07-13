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
    
    private var data: [Person] = []
    
    private func configureTableView() {
        self.tableView.register(TableViewCell.nib(),
                                forCellReuseIdentifier: TableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        self.configureTableView()
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        if let data = notification.userInfo?["data"] as? [Person] {
            self.data = data
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = data[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier)
        
        if let cell = cell as? TableViewCell {
            cell.configure(with: person.last_name,
                           age: person.dateOfBirtdh,
                           gender: person.gender)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
