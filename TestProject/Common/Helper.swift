//
//  Helper.swift
//  TestProject
//
//  Created by Admin on 13/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

class Helper {
    
    static func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year ?? 0
        return age
    }
    
    static func filterData(with data: [Person], parameters: [String : String]) -> [Person] {
        if parameters["gender"] == "Female" || parameters["gender"] == "Male"{
            data.filter {$0.gender == parameters["gender"]}
        }
        if parameters["age"] == "desc" {
            data.sorted(by: { $0.age > $1.age })
        } else {
            data.sorted(by: { $0.age < $1.age })
        }
        return data
    }
}
