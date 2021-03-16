//
//  Relationship.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/02.
//

import Foundation
import RealmSwift

class Relationship: Object {
    @objc dynamic var relationName = ""
    @objc dynamic var createdAt = Date()
    var talkPartners = List<Talkpartners>()
    
    static var realm = try! Realm()
    
    /// 関係タグを追加するメソッド
    /// - Parameters:
    ///   - talkPartners: 会話したい人モデル
    ///   - relationshipName: 関係タグ名
    ///   - results: 関係タグの検索結果
    static func append(_ talkpartnerRequest: TalkpartnerRequest, _ results: Results<Relationship>?) throws {
        do {
            try realm.write {
                for relationship in results! { // TODO:バリデーションロジック作ったらアンラップ消す
                    relationship.talkPartners.append(talkpartnerRequest.talkpartner)
                }
            }
        } catch {
            print(error)
        }
    }
    
    /// 関係タグを新規登録するメソッド
    /// - Parameters:
    ///   - talkPartners: 会話したい人モデル
    ///   - relationshipName: 関係タグ名
    static func create(_ talkpartnerRequest: TalkpartnerRequest) throws {
        do {
            try realm.write {
                realm.add(talkpartnerRequest.relationship)
            }
        } catch {
            print(error)
        }
    }
    
    /// 登録されている関係タグを全て取得するメソッド
    /// - Returns: 関係タグのコレクション
    static func all() -> Results<Relationship> {
        return realm.objects(Relationship.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
    
    
    /// 関係タグ検索メソッド
    /// - Parameter name: 検索する関係タグの名前
    /// - Returns: 検索で見つかった関係タグのコレクション or nil
    static func find(_ name: String) -> Results<Relationship>? {
        if self.count(name) != 0 {
            return realm.objects(Relationship.self).filter("relationName == '\(name)'")
        } else {
            return nil
        }
    }
    
    
    /// 関係タグの検索数をカウントするメソッド
    /// - Parameter name: 検索する関係タグ名
    /// - Returns: 検索でヒットした数
    static func count(_ name: String) -> Int {
        return realm.objects(Relationship.self).filter("relationName == '\(name)'").count
    }
}
