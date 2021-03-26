//
//  StockListOnly.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/19.
//

import SwiftUI

struct TopicList: View {
    
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        VStack {
            ForEach(memoTitles) { memoTitle in
                NavigationLink(destination: TopicEditView(barTitle: "編集",
                                                          buttonTitle: "更新")
                                .onAppear { self.tabBar.isHidden = true }
                                .onDisappear { self.tabBar.isHidden = false }
                ) {
                    TopicCell(title: memoTitle.title)
                }
            }
        }
        .frame(width: UIComponents.screenWidth / 1.1)
        .background(TabBarAccessor { tabbar in
            self.tabBar = tabbar
        })
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList()
    }
}
