//
//  TabBarView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/24.
//

import SwiftUI
import LocalAuthentication

struct TabBarView: View {
    
    @State var isUnlocked = false
    
    /// TouchID/FaceID認証をするメソッド
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthentication, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                         // 認証成功時
                        self.isUnlocked = true
                    } else {
                        // 認証失敗時、パスコードロック解除に移行
                    }
                }
            }
        } else {
            // TouchID/FaceIDをキャンセル
        }
    }
    
    var body: some View {
        
        if isUnlocked {
            TabView {
                PersonalListView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("パーソナル")
                    }
                StockListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("ストック")
                    }
            }
        } else {
            Text("")
            .onAppear() {
                self.authenticate()
            }
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
