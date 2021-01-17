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
    var tag: String
}

let memoTitles: [MemoTitle] = [
    .init(id: 0, title: "スタバ「大学芋フラペチーノ」を発売", tag: "カフェ"),
    .init(id: 1, title: "金麦に濃いめのひとときが出た！", tag: "発泡酒"),
    .init(id: 2, title: "無印良品「バクテー」が人気！", tag: "雑貨"),
    .init(id: 3, title: "世界最小のルービックキューブ発売", tag: "おもしろ"),
    .init(id: 4, title: "沖縄の田舎の人はコーラを何という？", tag: "おもしろ"),
    .init(id: 5, title: "沖縄の田舎の人は島ぞうりを何という？", tag: "おもしろ")
]
