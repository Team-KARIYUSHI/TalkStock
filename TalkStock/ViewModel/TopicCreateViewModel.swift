//
//  TopicCreateViewModel.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/03.
//

import RealmSwift
import Combine

final class TopicCreateViewModel: ObservableObject {
    
    var objectWillChange: ObservableObjectPublisher = .init()
    private(set) var relationship: Results<Relationship> = Relationship.all()
    
    private var notificationTokens: [NotificationToken] = []
    
    init() {
        notificationTokens.append(relationship.observe {_ in
            self.objectWillChange.send()
        })
    }
}
