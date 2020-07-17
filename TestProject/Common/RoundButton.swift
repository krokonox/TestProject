//
//  RoundButton.swift
//  TestProject
//
//  Created by Admin on 15/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: - UI Setup
    
    private func setup() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "greyColor")?.cgColor
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.titleLabel?.textAlignment = .center
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    // MARK: - IB Functions
    
    @objc func buttonClicked(sender: UIButton) {
        if isSelected == false {
            isSelected = true
            isHighlighted = true
            self.backgroundColor = UIColor(named: "greyColor")
        } else {
            isSelected = false
            isHighlighted = false
            self.backgroundColor = .white
        }
    }
}
