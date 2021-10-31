//
//  GetData.swift
//  AppConnect
//
//  Created by Douglas Santos on 31/10/21.
//

import Foundation

class GetData {
    static func getData() -> String {
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        let dateString = df.string(from: date)
        return dateString
    }
}
