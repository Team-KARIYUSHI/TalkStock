//
//  ConversationPartners.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/01.
//

import Foundation
import RealmSwift

final class Talkpartners: Object {
    // 中間テーブルで識別するためidを追加
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var personalName = ""
    @objc dynamic var image = Data()
    @objc dynamic var createdAt = Date()
    let relationship = LinkingObjects(fromType: Relationship.self, property: "talkPartners")
    
    // 中間テーブルにあたるモデルをListで定義
    var talkpartnerTopic = List<TalkpartnerTopic>()
    
    // プライマリーキーとして一意にする
    override static func primaryKey() -> String? {
        return "id"
    }

    static var realm = try! Realm()
    
    /// 会話したい人を全て取得するメソッド
    /// - Returns: 会話したい人のコレクション
    static func all() -> Results<Talkpartners> {
        return realm.objects(Talkpartners.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
    
    static func append(relationName: String, talkpartners: [Talkpartners]) {
        let results = Relationship.find(relationName)?.first
        try? realm.write {
            results?.talkPartners.append(objectsIn: talkpartners)
        }
    }
    
//    func delete(realm: Realm, object: Talkpartners) -> Bool {
//        do {
//            try realm.write { realm.delete(object) }
//            return true
//        } catch {
//            print(error)
//            return false
//        }
//    }
}

