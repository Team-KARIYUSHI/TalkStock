//
//  RelationshipManagement.swift
//  TalkStock
//
//  Created by kazuya on 2021/03/23.
//

import Foundation
import RealmSwift

// 会話したい人関係タグ管理モデル
final class RelationshipManagement: Object {
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static let realm = try! Realm()
    
    /// 取得したモデル件数をカウントするメソッド
    /// - Parameter object: 自分自身のモデル
    /// - Returns: モデル件数
    static func count(object: Results<RelationshipManagement>) -> Int {
        return object.count
    }
    
    // DBから全件取得してモデルを返すコンピューテッドプロパティ
    static var all: Results<RelationshipManagement> {
        return realm.objects(RelationshipManagement.self)
    }
}
