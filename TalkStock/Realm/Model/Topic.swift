//
//  Topic.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/07.
//

import Foundation
import RealmSwift

class Topic: Object {
    @objc dynamic var title = ""
    @objc dynamic var memo = ""
    @objc dynamic var url = ""
    @objc dynamic var createdAt = Date()
    
    let topicTag = LinkingObjects(fromType: TopicTag.self, property: "topic")
    
    static var realm = try! Realm()
    
    static func all() -> Results<Topic> {
        return realm.objects(Topic.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
}
