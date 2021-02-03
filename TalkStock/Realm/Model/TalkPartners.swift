//
//  ConversationPartners.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/01.
//

import Foundation
import RealmSwift

class TalkPertners: Object {
    @objc dynamic var name = ""
    @objc dynamic var createdAt = Date()
    let relationship = LinkingObjects(fromType: Relationship.self, property: "talkPartners")
    
    static var realm = try! Realm()
    
    static func all() -> Results<TalkPertners> {
        return realm.objects(TalkPertners.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
    
    
}

