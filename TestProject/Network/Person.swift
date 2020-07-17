//
//  Person.swift
//  TestProject
//
//  Created by Admin on 12/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct Person: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let gender: String
    let dateOfBirtdh: String
}

extension Person {
    var age: Int {
        return Helper.calcAge(birthday: self.dateOfBirtdh)
    }
}
