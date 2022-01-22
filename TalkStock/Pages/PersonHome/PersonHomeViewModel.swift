//
//  PersonHomeViewModel.swift
//  TalkStock
//
//  Created by kazuya on 2021/05/02.
//

import Foundation
import SwiftUI
import RealmSwift

class PersonHomeViewModel: ObservableObject {
    
    /// デフォルト：Relationshipモデルを取得してきたときの開始インデックスになるモデル
    /// フィルタリングメソッドを使ったら、絞り込み検索で取得したモデルに差し替える
    @Published var myRelationships: [RelationshipData] = try! Realm()
                                                                .objects(Relationship.self)
                                                                .map { RelationshipData(id: $0.id,
                                                                                        relationName: $0.relationName,
                                                                                        createdAt: $0.createdAt,
                                                                                        talkPartners: $0.talkPartners)
                                                                    
                                                                }
    
    
    /// タグボタンでフィルタリングするメソッド
    /// - Parameter relationName: ボタンを押した時のタグ名
    func filter(_ relationName: String) {
        self.myRelationships = try! Realm()
                                    .objects(Relationship.self)
                                    .filter("relationName == %@", relationName)
                                    .map { RelationshipData(id: $0.id,
                                                            relationName: $0.relationName,
                                                            createdAt: $0.createdAt,
                                                            talkPartners: $0.talkPartners)
                                        
                                    }
    }
}
