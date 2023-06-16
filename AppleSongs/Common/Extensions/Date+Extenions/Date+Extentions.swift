//
//  Date+Extentions.swift
//  AppleSongs
//
//  Created by Mohammad on 6/16/23.
//

import Foundation

extension String {

    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US")
        let yourDate: Date? = formatter.date(from: self)
        formatter.dateFormat = "yyyy/MM/DD"
        let convertDate = formatter.string(from: yourDate ?? .init())
        return convertDate
    }
}
