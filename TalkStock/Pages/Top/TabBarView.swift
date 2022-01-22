//
//  TabBarView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/24.
//

import SwiftUI
import LocalAuthentication

struct TabBarView: View {
    
    // LoginStateクラスのインスタンスを共有
    @EnvironmentObject var loginState: LoginState
    
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
                        self.loginState.isUnlocked = true
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
        
        if loginState.isUnlocked {
            TabView {
                PersonHomeView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("話したい人")
                    }
                TopicHomeView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("会話ネタ")
                    }
            }
        } else {
            EmptyStateView(imageName: EmptyState.splash.setImageName, color: Color(#colorLiteral(red: 0.3315601647, green: 0.7528054118, blue: 0.9943392873, alpha: 1)))
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
