//
//  TopicTag.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/07.
//

import Foundation
import RealmSwift

final class TopicTag: Object {
    @objc dynamic var tagName = ""
    @objc dynamic var createdAt = Date()
    var topic = List<Topic>()
    
    static var realm = try! Realm()
    
    
    static func add(topic: Topic, topicTagName: String) -> Bool {
        do {
            if let results = self.find(topicTagName) {
                try self.append(topic, results)
                return true
            } else {
                try self.create(topic, topicTagName)
                return true
            }
        } catch {
            print(error)
            return false
        }
    }
    
    
    static func append(_ topic: Topic, _ results: Results<TopicTag>?) throws {
        do {
            try realm.write {
                for topicTag in results! {
                    topicTag.topic.append(topic)
                }
            }
        } catch {
            print(error)
        }
    }
    
    
    static func create(_ topic: Topic, _ topicTagName: String) throws {
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
    
    
    static func find(_ name: String) -> Results<TopicTag>? {
        if self.count(name) != 0 {
            return realm.objects(TopicTag.self).filter("tagName == '\(name)'")
        } else {
            return nil
        }
    }
    
    
    static func count(_ name: String) -> Int {
        return realm.objects(TopicTag.self).filter("tagName == '\(name)'").count
    }
}


