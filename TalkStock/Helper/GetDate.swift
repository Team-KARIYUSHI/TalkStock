//
//  CreateDate.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/27.
//

import Foundation

struct GetDate {
    static func getToday(format:String = "yyyy-MM-dd") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
}
