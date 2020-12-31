//
//  SplashView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/31.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.3315601647, green: 0.7528054118, blue: 0.9943392873, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            Image("アプリロゴ")
                .resizable()
                .frame(width: UIComponents.screenWidth / 2, height: UIComponents.screenWidth / 2)
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
