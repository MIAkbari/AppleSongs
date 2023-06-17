//
//  Date+Extentions.swift
//  AppleSongs
//
//  Created by Mohammad on 6/16/23.
//

import Foundation

extension String {
    
    func convertToDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US")
        if let dt = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let formatedStringDate = dateFormatter.string(from: dt)
            return formatedStringDate
        }
        
        
        return "01-01-70"
    }
    
}
