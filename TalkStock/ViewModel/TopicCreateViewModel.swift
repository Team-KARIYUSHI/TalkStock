//
//  TopicCreateViewModel.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/03.
//
import SwiftUI
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
    
    @Published var alertItem: AlertItem? = nil
    
    func create(topic: Topic,
                topicTagName: String,
                completeAction: @escaping(()->Void))
    {
        if TopicTag.add(topic: topic,
                        topicTagName: topicTagName) {
            self.alertItem = AlertItem(alert: Alert(title: Text("登録が完了しました"),
                                                    message: nil,
                                                    dismissButton: .default(Text("OK")){
                                                        completeAction()
                                                    }))
        } else {
            self.alertItem = AlertItem(alert: Alert(title: Text("登録に失敗しました")))
        }
    }
    
}
