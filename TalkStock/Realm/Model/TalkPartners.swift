//
//  ConversationPartners.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/01.
//

import Foundation
import RealmSwift

class TalkPertners: Object {
    @objc dynamic var personalName = ""
    @objc dynamic var image = Data()
    @objc dynamic var createdAt = Date()
    let relationship = LinkingObjects(fromType: Relationship.self, property: "talkPartners")
    
    static var realm = try! Realm()
    
    
    /// 会話したい人を全て取得するメソッド
    /// - Returns: 会話したい人のコレクション
    static func all() -> Results<TalkPertners> {
        return realm.objects(TalkPertners.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
    
    
}

