//
//  Relationships.swift
//  TalkStock
//
//  Created by kazuya on 2021/03/23.
//

import Foundation
import RealmSwift

let relationships = [
    Relationship(value: ["relationName":"友達",
                         "relationshipManagement": RelationshipManagement(value: ["name":"友達"]),
                         "talkPartners":talkPartners]),
    Relationship(value: ["relationName":"同僚",
                         "relationshipManagement": RelationshipManagement(value: ["name":"同僚"]),
                         "talkPartners":talkPartners]),
    Relationship(value: ["relationName":"家族",
                         "relationshipManagement": RelationshipManagement(value: ["name":"家族"]),
                         "talkPartners":talkPartners]),
    Relationship(value: ["relationName":"恋人",
                         "relationshipManagement": RelationshipManagement(value: ["name":"恋人"]),
                         "talkPartners":talkPartners]),
]

let talkpartnerTopics = [
    TalkpartnerTopic(value: ["talkpartner": talkPartners[0], "topic": topics[0]]),
    TalkpartnerTopic(value: ["talkpartner": talkPartners[0], "topic": topics[1]]),
    TalkpartnerTopic(value: ["talkpartner": talkPartners[0], "topic": topics[2]]),
    TalkpartnerTopic(value: ["talkpartner": talkPartners[0], "topic": topics[3]]),
    TalkpartnerTopic(value: ["talkpartner": talkPartners[0], "topic": topics[4]]),
    TalkpartnerTopic(value: ["talkpartner": talkPartners[0], "topic": topics[5]]),
]

let talkPartners = [
    Talkpartners(value: ["id":UUID().uuidString, "personalName": "和也", "image": Data()]),
    Talkpartners(value: ["id":UUID().uuidString, "personalName": "りょう", "image": Data()]),
    Talkpartners(value: ["id":UUID().uuidString, "personalName": "みき", "image": Data()]),
    Talkpartners(value: ["id":UUID().uuidString, "personalName": "みっちゃん", "image": Data()]),
    Talkpartners(value: ["id":UUID().uuidString, "personalName": "かっちゃん", "image": Data()]),
    Talkpartners(value: ["id":UUID().uuidString, "personalName": "あっちゃん", "image": Data()]),
]

let topics = [
    Topic(value: ["id": UUID().uuidString, "title": "ほげ","memo":"ホゲホゲ", "url": "http://hogehoge.com"]),
    Topic(value: ["id": UUID().uuidString, "title": "ふが","memo":"フガフガふが", "url": "http://hogehoge.com"]),
    Topic(value: ["id": UUID().uuidString, "title": "ほげふが","memo":"ホゲホゲホゲホゲ", "url": "http://hogehoge.com"]),
    Topic(value: ["id": UUID().uuidString, "title": "フガフガ","memo":"ホゲホゲ", "url": "http://hogehoge.com"]),
    Topic(value: ["id": UUID().uuidString, "title": "ほほ","memo":"ホゲホゲ", "url": "http://hogehoge.com"]),
    Topic(value: ["id": UUID().uuidString, "title": "ふふ","memo":"ホゲホゲ", "url": "http://hogehoge.com"]),
]


