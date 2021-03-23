//
//  Relationship.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/02.
//

import Foundation
import RealmSwift

final class Relationship: Object {
    @objc dynamic var relationName = ""
    @objc dynamic var createdAt = Date()
    @objc dynamic var relationshipManagement: RelationshipManagement?
    var talkPartners = List<Talkpartners>()
    
    static var realm = try! Realm()
    
    /// 関係タグを追加するメソッド
    /// - Parameters:
    ///   - talkpartnerRequest: 会話したい人リクエストクラス
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
    ///   - talkpartnerRequest: 会話したい人リクエストクラス
    static func create(_ talkpartnerRequest: TalkpartnerRequest) throws {
        do {
            try realm.write {
                realm.add(talkpartnerRequest.relationship)
            }
        } catch {
            print(error)
        }
    }
    
    /// 登録されている関係タグを全て取得するコンピューテッドプロパティ
    /// - Returns: 関係タグのコレクション
    static var all: Results<Relationship> {
        return realm.objects(Relationship.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
    
    
    /// 関係タグ検索メソッド
    /// - Parameter name: 検索する関係タグの名前
    /// - Returns: 検索で見つかった関係タグのコレクション or nil
    static func find(_ name: String) -> Results<Relationship>? {
        let object = realm.objects(Relationship.self).filter("relationName == '\(name)'")
        if self.count(object) != 0 {
            return object
        } else {
            return nil
        }
    }
    
    
    /// 関係タグの検索数をカウントするメソッド
    /// - Parameter object: 会話したい人関係の取得モデル
    /// - Returns: 検索でヒットした数
    static func count(_ object: Results<Relationship>) -> Int {
        return object.count
    }
    
    
    /// 自身のモデルを登録するメソッド
    /// - Parameter relationships: 会話したい人モデルの配列
    static func makeSelf(_ relationships:[Relationship]) {
        do {
            try realm.write {
                for relationship in relationships {
                    realm.add(relationship)
                }
            }
        } catch {
            print(error)
        }
    }
    
    
    /// 会話したい人管理モデルのデータを登録するメソッド
    /// - Parameter relationships: 会話したい人管理モデル
    static func addOriginal(_ relationships: Results<RelationshipManagement>) {
        do {
            try realm.write {
                for relationship in relationships {
                    realm.add(Relationship(value: ["name":relationship.name, "relationshipManagement":relationship]))
                }
            }
        } catch {
            print(error)
        }
    }
}
