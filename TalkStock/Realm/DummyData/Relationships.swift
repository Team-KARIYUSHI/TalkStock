//
//  Relationships.swift
//  TalkStock
//
//  Created by kazuya on 2021/03/23.
//

import Foundation
import RealmSwift

let relationships = [
    Relationship(value: ["relationName":"友達", "relationshipManagement": RelationshipManagement(value: ["name":"友達"])]),
    Relationship(value: ["relationName":"同僚", "relationshipManagement": RelationshipManagement(value: ["name":"同僚"])]),
    Relationship(value: ["relationName":"家族", "relationshipManagement": RelationshipManagement(value: ["name":"家族"])]),
    Relationship(value: ["relationName":"恋人", "relationshipManagement": RelationshipManagement(value: ["name":"恋人"])]),
]
