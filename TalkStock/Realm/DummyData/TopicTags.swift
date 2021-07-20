//
//  TopicTags.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/03/30.
//

import Foundation
import RealmSwift

let topicTags = [
    TopicTag(value: ["tagName":"グルメ", "topicTagManagement": TopicTagManagement(value: ["name":"グルメ"])]),
    TopicTag(value: ["tagName":"おもしろ", "topicTagManagement": TopicTagManagement(value: ["name":"おもしろ"])]),
    TopicTag(value: ["tagName":"スポーツ", "topicTagManagement": TopicTagManagement(value: ["name":"スポーツ"])]),
    TopicTag(value: ["tagName":"健康", "topicTagManagement": TopicTagManagement(value: ["name":"健康"])]),
    TopicTag(value: ["tagName":"音楽", "topicTagManagement": TopicTagManagement(value: ["name":"音楽"])]),
    TopicTag(value: ["tagName":"旅行", "topicTagManagement": TopicTagManagement(value: ["name":"旅行"])]),
    TopicTag(value: ["tagName":"仕事", "topicTagManagement": TopicTagManagement(value: ["name":"仕事"])]),
    TopicTag(value: ["tagName":"趣味", "topicTagManagement": TopicTagManagement(value: ["name":"趣味"])]),
    TopicTag(value: ["tagName":"恋愛", "topicTagManagement": TopicTagManagement(value: ["name":"恋愛"])]),
    TopicTag(value: ["tagName":"雑学", "topicTagManagement": TopicTagManagement(value: ["name":"雑学"])]),
    TopicTag(value: ["tagName":"その他", "topicTagManagement": TopicTagManagement(value: ["name":"その他"])]),
    
]

let dummyTopics = [
    Topic(value: ["title":"健康", "memo":"", "url":"http://hogehoge.com"]),
    Topic(value: ["title":"おもしろ", "memo":"", "url":"http://hogehoge.com"]),
    Topic(value: ["title":"ニュース", "memo":"", "url":"http://hogehoge.com"]),
    Topic(value: ["title":"スタバに新作登場「抹茶クリームフラペチーノ」若い世代に大人気", "memo":"", "url":"http://hogehoge.com"]),
    Topic(value: ["title":"お酒", "memo":"", "url":"http://hogehoge.com"]),
    Topic(value: ["title":"お茶", "memo":"", "url":"http://hogehoge.com"]),

]
