//
//  TableViewCell.swift
//  TestProject
//
//  Created by Admin on 13/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    static let identifier = "TableViewCell"
    
    static func nib() -> UINib {
        print("called")
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func configure(with name: String, age: String, gender: String) {
        self.nameLabel.text = name
        self.ageLabel.text = age
        self.genderLabel.text = gender
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
