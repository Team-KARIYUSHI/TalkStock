//
//  TopicTagManagement.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/03/28.
//

import Foundation
import RealmSwift

final class TopicTagManagement: Object {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static let realm = try! Realm()
    
    static func count(object: Results<TopicTagManagement>) -> Int {
        return object.count
    }
    
    static var all: Results<TopicTagManagement> {
        return realm.objects(TopicTagManagement.self)
    }
}
