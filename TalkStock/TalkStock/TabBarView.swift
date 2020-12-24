//
//  TabBarView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("パーソナル画面")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("パーソナル")
                }
            Text("ストック一覧")
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("ストック")
                }
            Text("ニュース一覧")
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("ニュース")
                }
        }
        
        
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
