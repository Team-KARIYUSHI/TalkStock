//
//  TopicTag.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/07.
//

import Foundation
import RealmSwift

class TopicTag: Object {
    @objc dynamic var tagName = ""
    @objc dynamic var createdAt = Date()
    var topic = List<Topic>()
    
    static var realm = try! Realm()
    
    static func create(topicTagName: String, topicTitle: String, topicMemo: String, topicUrl: String) {
        do {
            let topicTag = TopicTag()
            let topic = Topic()
            topicTag.tagName = topicTagName
            topic.title = topicTitle
            topic.memo = topicMemo
            topic.url = topicUrl
            topicTag.topic.append(topic)
            try realm.write {
                realm.add(topicTag)
                realm.add(topic)
            }
        } catch {
            print(error)
        }
    }
    
    static func all() -> Results<TopicTag> {
        return realm.objects(TopicTag.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
}
