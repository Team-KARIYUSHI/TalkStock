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
            PersonalView()
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
        
        
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
