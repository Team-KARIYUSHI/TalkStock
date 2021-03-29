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
    
    /// 取得したモデル件数をカウントするメソッド
    /// - Parameter object: 自分自身のモデル
    /// - Returns: モデル件数
    static func count(object: Results<TopicTagManagement>) -> Int {
        return object.count
    }
    
    // DBから全件取得してモデルを返すコンピューテッドプロパティ
    static var all: Results<TopicTagManagement> {
        return realm.objects(TopicTagManagement.self)
    }
}
