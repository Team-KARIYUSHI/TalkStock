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
    var talkPartners = List<TalkPertners>()
    
    static var realm = try! Realm()
    
    
    ///
    /// - Parameters:
    ///   - talkPartners:
    ///   - relationshipName:
    /// - Return:
    
    /// 関係タグを追加or新規登録するメソッド（要修正）
    /// - Parameters:
    ///   - talkPartners: 会話したい人モデル
    ///   - relationshipName: 関係タグ名
    /// - Returns: True(登録成功時) / False(登録失敗時)
    static func add(talkPartners: TalkPertners, relationshipName: String) -> Bool {
        do {
            if let results = self.find(relationshipName) {
                // 関係タグがある時は追加
                try self.append(talkPartners, relationshipName, results)
                return true
            } else {
                // 関係タグが登録されてない時は新規登録
                try self.create(talkPartners, relationshipName)
                return true
            }
        } catch {
            print(error)
            return false
        }
    }
    
    /// 関係タグを追加するメソッド
    /// - Parameters:
    ///   - talkPartners: 会話したい人モデル
    ///   - relationshipName: 関係タグ名
    ///   - results: 関係タグの検索結果
    static func append(_ talkPartners: TalkPertners, _ relationshipName: String, _ results: Results<Relationship>?) throws {
        do {
            try realm.write {
                for relationship in results! { // TODO:バリデーションロジック作ったらアンラップ消す
                    relationship.talkPartners.append(talkPartners)
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
    static func create(_ talkPartners: TalkPertners, _ relationshipName: String) throws {
        do {
            try realm.write {
                realm.add(Relationship(value: ["relationName":relationshipName, "talkPartners":[talkPartners]]))
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
