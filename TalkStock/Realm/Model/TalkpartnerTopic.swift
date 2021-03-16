//
//  TalkpartnerTopic.swift
//  TalkStock
//
//  Created by kazuya on 2021/03/16.
//

import Foundation
import RealmSwift

class TalkpartnerTopic: Object {
    @objc dynamic var topic: Topic?
    @objc dynamic var talkpartner: Talkpartners?
    let ownerTopic = LinkingObjects(fromType: Topic.self, property: "talkpartnerTopic")
    let ownerTalkpartnerTopic = LinkingObjects(fromType: Talkpartners.self, property: "talkpartnerTopic")
    
    /// 会話したい人→会話ネタ（1:多の時）登録メソッド
    /// - Parameters:
    ///   - talkpartnerRequest: 会話したい人登録専用のリクエストクラス
    static func createTalkpartnerAndManyTopics(_ talkpartnerRequest: TalkpartnerRequest) throws {
        let realm = try! Realm()
        do {
            try realm.write {
                guard let topics = talkpartnerRequest.topics else {return}
                self.appendTalkpartnerAndManyTopics(talkpartnerRequest)
                for topic in topics {
                    realm.add(topic)
                }
                realm.add(talkpartnerRequest.talkpartner)
            }
        } catch {
            print(error)
        }
    }
    
    /// 会話したい人→会話ネタ（1:多）の中間テーブル追加メソッド
    /// - Parameter talkpartnerRequest: 会話したい人:会話ネタ（1:多の時）のパラメータ
    private static func appendTalkpartnerAndManyTopics(_ talkpartnerRequest: TalkpartnerRequest) {
        // 会話ネタがない時は処理を抜ける
        guard let topics = talkpartnerRequest.topics else {return}
        for i in 0..<topics.count {
            talkpartnerRequest
                .topics?[i]
                .talkpartnerTopic
                .append(talkpartnerRequest.talkpartnerTopics![i])
            talkpartnerRequest
                .talkpartner
                .talkpartnerTopic
                .append(talkpartnerRequest.talkpartnerTopics![i])
        }
    }
    
    
}
