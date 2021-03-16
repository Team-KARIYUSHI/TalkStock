//
//  PersonCreateService.swift
//  TalkStock
//
//  Created by kazuya on 2021/03/16.
//

import Foundation
import RealmSwift

/// PersonCreateViewModel専用のServiceクラス
final class PersonCreateSrvice {
    
    /// 会話したい人追加メソッド
    /// - Parameter talkpartnerRequest: 会話したい人と会話ネタを登録する時に利用するリクエストクラス
    /// - Returns: true:登録成功 / false: 登録失敗
    static func add(_ talkpartnerRequest: TalkpartnerRequest) -> Bool {
        do {
            if let results = Relationship.find(talkpartnerRequest.relationName) {
                // 会話したい人関係タグがある時は、関係タグのListに会話したい人を追加する
                try Relationship.append(talkpartnerRequest, results)
            } else {
                // 登録がない時は関係タグのListに新規登録する
                try Relationship.create(talkpartnerRequest)
                // 会話ネタがリクエストにあれば中間テーブルに追加する
                try TalkpartnerTopic.createTalkpartnerAndManyTopics(talkpartnerRequest)
            }
            return true
        } catch {
            print(error)
            return false
        }
    }
}
