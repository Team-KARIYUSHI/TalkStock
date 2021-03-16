//
//  Topic.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/07.
//

import Foundation
import RealmSwift

class Topic: Object {
    // 中間テーブルで識別するためidを追加
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var memo = ""
    @objc dynamic var url = ""
    @objc dynamic var createdAt = Date()
    
    let topicTag = LinkingObjects(fromType: TopicTag.self, property: "topic")
    
    // 中間テーブルにあたるモデルをListで定義
    var talkpartnerTopic = List<TalkpartnerTopic>()
    
    // プライマリーキーとして一意にする
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static var realm = try! Realm()
    
    static func all() -> Results<Topic> {
        return realm.objects(Topic.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
}
