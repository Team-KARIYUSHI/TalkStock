//
//  StockListOnly.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/19.
//

import SwiftUI

struct TopicList: View {
    
    var body: some View {
        VStack {
            ForEach(memoTitles) { memoTitle in
                NavigationLink(destination: EmptyView()) {
                    TopicCell(title: memoTitle.title)
                }
            }
        }.frame(width: UIComponents.screenWidth / 1.1)
    }
}

struct TopicList_Previews: PreviewProvider {
    static var previews: some View {
        TopicList()
    }
}
