//
//  TopicTag.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/07.
//

import Foundation
import RealmSwift

final class TopicTag: Object {
    @objc dynamic var tagName = ""
    @objc dynamic var createdAt = Date()
    @objc dynamic var topicTagManagement: TopicTagManagement?
    var topic = List<Topic>()
    
    static var realm = try! Realm()
    
    
    static func add(topic: Topic, topicTagName: String) -> Bool {
        do {
            if let results = self.find(topicTagName) {
                try self.append(topic, results)
                return true
            } else {
                try self.create(topic, topicTagName)
                return true
            }
        } catch {
            print(error)
            return false
        }
    }
    
    
    static func append(_ topic: Topic, _ results: Results<TopicTag>?) throws {
        do {
            try realm.write {
                for topicTag in results! {
                    topicTag.topic.append(topic)
                }
            }
        } catch {
            print(error)
        }
    }
    
    
    static func create(_ topic: Topic, _ topicTagName: String) throws {
        do {
            try realm.write {
                realm.add(TopicTag(value:["tagName":topicTagName,
                                          "topic":[topic]]))
            }
        } catch {
            print(error)
        }
    }
    
    /// 登録されている会話ネタタグを全て取得するコンピューテッドプロパティ
    /// - Returns: 会話ネタタグのコレクション
    static var all: Results<TopicTag> {
        return realm.objects(TopicTag.self).sorted(byKeyPath: "createdAt", ascending: true)
    }
    
    /// 会話ネタタグ検索メソッド
    /// - Parameter name: 検索する会話ネタタグの名前
    /// - Returns: 検索で見つかった会話ネタタグのコレクション or nil
    static func find(_ name: String) -> Results<TopicTag>? {
        let object = realm.objects(TopicTag.self).filter("tagName == '\(name)'")
        if self.count(object) != 0 {
            return object
        } else {
            return nil
        }
    }
    
    /// 会話ネタタグの検索数をカウントするメソッド
    /// - Parameter object: 会話ネタタグの取得モデル
    /// - Returns: 検索でヒットした数
    static func count(_ object: Results<TopicTag>) -> Int {
        return object.count
    }
    
    /// 自身のモデルを登録するメソッド
    /// - Parameter topicTags: 会話ネタタグモデルの配列
    static func makeSelf(_ topicTags:[TopicTag]) {
        do {
            try realm.write {
                for topicTag in
                    topicTags {
                    realm.add(topicTag)
                }
            }
        } catch {
            print(error)
        }
    }
    
    /// 会話ネタタグ管理モデルのデータを登録するメソッド
    /// - Parameter topicTags: 会話ネタタグ管理モデル
    static func addOriginal(_ topicTags: Results<TopicTagManagement>) {
        do {
            try realm.write {
                for topicTag in
                    topicTags {
                    realm.add(TopicTag(value: ["name":topicTag.name,
                                               "topicTagManagement":topicTag]))
                }
            }
        } catch {
            print(error)
        }
    }
}


