//
//  TableViewController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Variables
    
    @IBOutlet weak var tableView: UITableView!
    
    private var data: [Person] = [] {
        didSet {
            print(data)
            self.tableView.reloadData()
        }
    }
    
    // MARK: - UI Setup
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshCntrl = UIRefreshControl()
        refreshCntrl.attributedTitle =  NSAttributedString(string: "Pull to refresh")
        refreshCntrl.addTarget(self, action: #selector(refresh),
                               for: UIControl.Event.valueChanged)
        return refreshCntrl
    }()
    
    private func configureTableView() {
        self.tableView.addSubview(refreshControl)
        self.tableView.register(TableViewCell.nib(),
                                forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidFilterData(_:)), name: .didApplyFilter, object: nil)
        self.configureTableView()
    }
    
    // MARK: - Functions
    
    @objc func onDidReceiveData(_ notification: Notification) {
        print("receive")
        if let data = notification.userInfo?["data"] as? [Person] {
            self.data = data
        }
    }
    
    @objc func onDidFilterData(_ notification: Notification) {
        if let parameters = notification.userInfo?["details"] as? [String : String] {
            self.data = Helper.filterData(with: data, parameters: parameters)
        }
    }
    
    @objc func refresh(sender: AnyObject) {
        APIClient.sh.request() { [weak self] (data: [Person]?, error) in
            if let data = data {
                self?.data = data
            } else {
                self?.alert(message: error?.description ?? "")
            }
        }
    }
}

// MARK: - TableView Extension

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = data[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier)
        if let cell = cell as? TableViewCell {
            cell.selectionStyle = .none
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "PersonDetailViewController") as! PersonDetailViewController
        _ = viewController.view
        
        viewController.configure(with: data[indexPath.row])
        self.show(viewController, sender: self)
    }
}
