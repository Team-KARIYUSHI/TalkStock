//
//  PersonEditViewModel.swift
//  TalkStock
//
//  Created by kazuya on 2021/05/17.
//

import Foundation
import SwiftUI

class PersonEditViewModel: ObservableObject {
    
    var service: PersonEditProtocol
    
    init(service: PersonEditProtocol) {
        self.service = service
    }
    
    func delete(object: Talkpartners?, handler: @escaping()->Void) -> AlertItem {
        if service.delete(object: object) {
            return AlertItemType.completeDelete.switchDeleteAlert(completion: handler)
        } else {
            return AlertItemType.failedDelete.switchDeleteAlert(completion: {})
        }
    }
    
}
