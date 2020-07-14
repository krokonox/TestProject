//
//  PersonDetailViewController.swift
//  TestProject
//
//  Created by Admin on 14/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func configure(with person: Person) {
        self.firstNameLabel.text = person.first_name
        self.LastNameLabel.text = person.last_name
        self.ageLabel.text = String(person.age)
        self.genderLabel.text = person.gender
        self.emailLabel.text = person.email
    }
}
