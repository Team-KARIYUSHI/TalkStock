//
//  TalkpartnerRequest.swift
//  TalkStock
//
//  Created by kazuya on 2021/03/16.
//

import Foundation
import RealmSwift


/// 会話したい人登録/編集専用のプロトコル
protocol TalkpartnerProtocol {
    var relationName: String { get set }
    var relationship: Relationship { get }
    var talkpartner: Talkpartners { get set }
    var topics: Results<Topic>? { get set }
    var talkpartnerTopics: [TalkpartnerTopic]? { get }
}

/// 会話したい人登録/編集専用のリクエストクラス（上記のプロトコルを継承）
struct TalkpartnerRequest: TalkpartnerProtocol {
    var relationName: String
    var talkpartner: Talkpartners
    
    // Relationshipモデルのコンピューテッドプロパティ
    // 関係タグ名（relationName）と会話したい人（talkpartner）を設定して返すだけ
    var relationship: Relationship {
        return Relationship(value: ["relationName": relationName, "talkPartners": [talkpartner]])
    }
    
    // Realmから取得してきた会話ネタ
    var topics: Results<Topic>?
    
    // TalkpartnerTopicのコンピューテッドプロパティ(値を返すだけ)
    // 会話したい人（talkpartner）と会話ネタ（topics）を設定して返すだけ。会話ネタがある分だけ配列を作る
    var talkpartnerTopics: [TalkpartnerTopic]? {
        guard let results = topics else { return nil }
        var newValue: [TalkpartnerTopic] = []
        for i in 0..<results.count {
            newValue.append(TalkpartnerTopic(value: ["topic":results[i],
                 "talkpartner":talkpartner]))
        }
        return newValue
    }
}
