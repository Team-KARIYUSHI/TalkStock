//
//  SplashView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/31.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
            
        VStack {
            Image("app_logo")
                .resizable()
                .frame(width: UIComponents.screenWidth / 2,
                       height: UIComponents.screenWidth / 2)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .center)
        .background(Color(#colorLiteral(red: 0.3315601647, green: 0.7528054118, blue: 0.9943392873, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
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
