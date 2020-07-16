//
//  CollectionViewController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var data: [Person] = [] {
        didSet {
            //self.collectionView.reloadData()
        }
    }
    
    private var filteredData: [Person] = [] {
        didSet {
            self.collectionView.reloadData()
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
    
    private func configureCollectionView() {
        self.collectionView.addSubview(refreshControl)
        self.collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerObserver()
        self.configureCollectionView()
    }
    
    // MARK: - Functions
    
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidFilterData(_:)), name: .didApplyFilter, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidResetFilter(_:)), name: .didResetFilter, object: nil)
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
    
     @objc func onDidReceiveData(_ notification: Notification) {
          if let data = notification.userInfo?["data"] as? [Person] {
            self.data = data
            self.filteredData = self.data
          }
      }
    
    @objc func onDidFilterData(_ notification: Notification) {
        if let parameters = notification.userInfo?["details"] as? [String : String] {
            self.filteredData = Helper.filterData(with: data, parameters: parameters)
        }
    }
    
    @objc func onDidResetFilter(_ notification: Notification) {
        self.filteredData = self.data
    }
}

// MARK: - TableView Extension

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let person = filteredData[indexPath.row]
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            cell.configure(with: person.last_name,
                           age: String(person.age),
                           gender: person.gender)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "PersonDetailViewController") as! PersonDetailViewController
        _ = viewController.view
        
        viewController.configure(with: data[indexPath.row])
        self.show(viewController, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)
       }
}
