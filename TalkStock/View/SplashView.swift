//
//  SplashView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/31.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
            
        EmptyStateView(imageName: EmptyState.splash.setImageName)
        .onAppear() { // SplashViewを読み込んだ時にTabBarViewをRootViewに入替える
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                NotificationCenter.default.post(name:NSNotification.Name("home"),
                                                object: nil)
            }
            
            NotificationCenter.default.removeObserver(self)
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
