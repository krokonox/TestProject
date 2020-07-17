//
//  String+Ex.swift
//  TestProject
//
//  Created by Admin on 13/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

extension String {
    func returnAsDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date
    }
}
