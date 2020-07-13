//
//  CollectionViewCell.swift
//  TestProject
//
//  Created by Admin on 13/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//


import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: nil)
    }
    
    func configure(with name: String, age: String, gender: String) {
        self.nameLabel.text = name
        self.ageLabel.text = age
        self.genderLabel.text = gender
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
