//
//  CollectionViewController.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var data: [Person] = []
    
    private func configureCollectionView() {
        self.collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
    }
    
    @objc func onDidReceiveData(_ notification: Notification) {
        if let data = notification.userInfo?["data"] {
            print(data)
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let person = data[indexPath.row]
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            cell.configure(with: person.last_name,
                           age: person.dateOfBirtdh,
                           gender: person.gender)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
