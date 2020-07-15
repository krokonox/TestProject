//
//  RoundButton.swift
//  TestProject
//
//  Created by Admin on 15/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.textColor = .darkGray
    }
}
