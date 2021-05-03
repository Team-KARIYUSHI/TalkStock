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
    @Published var myRelationships: [RelationshipData] = try! Realm()
                                                                .objects(Relationship.self)
                                                                .map { RelationshipData(id: $0.id,
                                                                                        relationName: $0.relationName,
                                                                                        createdAt: $0.createdAt,
                                                                                        talkPartners: $0.talkPartners)
                                                                    
                                                                }
    func filter(_ relationName: String) {
        self.myRelationships = try! Realm()
                                    .objects(Relationship.self)
                                    .filter("relationName == %@", relationName)
                                    .map { RelationshipData(id: $0.id,
                                                            relationName: $0.relationName,
                                                            createdAt: $0.createdAt,
                                                            talkPartners: $0.talkPartners)
                                        
                                    }
        print("myRelationshipsの結果->", myRelationships)
    }
}
