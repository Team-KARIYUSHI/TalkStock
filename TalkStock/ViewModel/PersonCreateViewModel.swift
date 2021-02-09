//
//  PersonCreateViewModel.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/09.
//

import RealmSwift
import Combine

final class PersonCreateViewModel: ObservableObject {
    
    var objectWillChange: ObservableObjectPublisher = .init()
    private(set) var topicTag: Results<TopicTag> = TopicTag.all()
    
    private var notificationTokens: [NotificationToken] = []
    
    init() {
        notificationTokens.append(topicTag.observe {_ in
            self.objectWillChange.send()
        })
    }
}
