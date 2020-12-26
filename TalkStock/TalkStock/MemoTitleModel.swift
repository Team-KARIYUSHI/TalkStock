//
//  MemoTitleModel.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/26.
//

import Foundation

struct MemoTitle: Identifiable {
    var id: Int
    var title: String
}

let memoTitles: [MemoTitle] = [
    .init(id: 0, title: "スタバ「大学芋フラペチーノ」を発売"),
    .init(id: 1, title: "金麦に濃いめのひとときが出た！"),
    .init(id: 2, title: "無印良品「バクテー」が人気！"),
    .init(id: 3, title: "世界最小のルービックキューブ発売")
]
