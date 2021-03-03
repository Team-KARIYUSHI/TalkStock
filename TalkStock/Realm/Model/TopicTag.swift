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
    
    static func create(_ topic: Topic, _ topicTagName: String) {
        do {
            try realm.write {
                realm.add(TopicTag(value:["tagName":topicTagName,
                                          "topic":[topic]]))
            }
        } catch {
            print(error)
        }
    }
    
    static func all() -> Results<TopicTag> {
        return realm.objects(TopicTag.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
}
