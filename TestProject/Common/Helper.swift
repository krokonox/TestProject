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
        guard let birthday = birthdayDate else { return 0 }
        let calcAge = calendar.components(.year, from: birthday, to: now, options: [])
        let age = calcAge.year ?? 0
        return age
    }
    
    static func filterData(with data: [Person], parameters: [String : String]) -> [Person] {
        var arr: [Person] = []
        print(arr.count)
        if parameters["gender"] == "Female" || parameters["gender"] == "Male"{
            arr.append(contentsOf: data.filter{$0.gender == parameters["gender"]})
        }
        if parameters["age"] == "desc" {
            arr.append(contentsOf: data.sorted(by: { $0.age > $1.age }))
        } else {
            arr.append(contentsOf: data.sorted(by: { $0.age < $1.age }))
        }
        print(arr.count)
        return arr
    }
}
