//
//  PersonSummary.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/10.
//

import Foundation

struct PersonSummary: Identifiable {
    var id: Int
    var personName: String
    var relationship: String
    var stockNum: String
}

let personSummary: [PersonSummary] = [
    .init(id: 0, personName: "愛知太郎", relationship: "友達", stockNum: "4"),
    .init(id: 1, personName: "愛知花子", relationship: "同僚", stockNum:  "2"),
    .init(id: 2, personName: "名古屋次郎", relationship: "取引先", stockNum: "7"),
    .init(id: 3, personName: "愛知次郎", relationship: "ビジネスパートナー", stockNum: "7")
]
