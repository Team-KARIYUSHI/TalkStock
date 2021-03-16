//
//  PersonCreateViewModel.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/09.
//

import SwiftUI
import RealmSwift
import Combine

final class PersonCreateViewModel: ObservableObject {
    
    var objectWillChange: ObservableObjectPublisher = .init()
    private(set) var topic: Results<Topic> = Topic.all()
    
    private var notificationTokens: [NotificationToken] = []
    
    init() {
        notificationTokens.append(topic.observe {_ in
            self.objectWillChange.send()
        })
    }
    
    @Published var alertItem: AlertItem? = nil
    
    /// 登録メソッド
    /// - Parameters:
    ///   - relationshipName: 関係タグ名
    ///   - talkPartners: 会話したい人モデル
    ///   - completeAction: 登録完了時のアクション
    func create(_ talkpartnerRequest: TalkpartnerRequest,
                completeAction: @escaping(()->Void))
    {
        // Serviceクラスからの返り値を一時保管
        let result = PersonCreateSrvice.add(talkpartnerRequest)
        if result {
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
