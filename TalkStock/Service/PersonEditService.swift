//
//  PersonEditService.swift
//  TalkStock
//
//  Created by kazuya on 2021/05/17.
//

import Foundation
import RealmSwift

protocol PersonEditProtocol {
    func delete(object: Talkpartners?) -> Bool
}

class PersonEditService: PersonEditProtocol {
    func delete(object: Talkpartners?) -> Bool {
       guard let result = object else {return false}
        let realm = try! Realm()
        do {
            try realm.write { realm.delete(result) }
            return true
        } catch {
            print(error)
            return false
        }
    }
}
