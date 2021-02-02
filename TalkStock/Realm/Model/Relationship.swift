//
//  Relationship.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/02.
//

import Foundation
import RealmSwift

class Relationship: Object {
    @objc dynamic var name = ""
    @objc dynamic var createdAt = Date()
    var talkPartners = List<TalkPertners>()
    
    static var realm = try! Realm()
    
    static func create(relationshipName: String, talkPartnersName: String) {
        do {
            let relationship = Relationship()
            let talkPartners = TalkPertners()
            relationship.name = relationshipName
            talkPartners.name = talkPartnersName
            relationship.talkPartners.append(talkPartners)
            try realm.write {
                realm.add(relationship)
                realm.add(talkPartners)
            }
        } catch {
            print(error)
        }
    }
    
    static func all() -> Results<Relationship> {
        return realm.objects(Relationship.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
}
