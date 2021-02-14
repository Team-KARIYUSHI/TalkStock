//
//  PersonSummary.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/10.
//

import Foundation

struct PersonSummary: Identifiable {
    var id: Int
    var name: String
    var relationship: String
    var topicNum: String
}

let personSummary: [PersonSummary] = [
    .init(id: 0, name: "愛知太郎", relationship: "友達", topicNum: "4"),
    .init(id: 1, name: "愛知花子", relationship: "同僚", topicNum:  "2"),
    .init(id: 2, name: "名古屋次郎", relationship: "取引先", topicNum: "7"),
    .init(id: 3, name: "愛知次郎", relationship: "ビジネスパートナー", topicNum: "7")
]
