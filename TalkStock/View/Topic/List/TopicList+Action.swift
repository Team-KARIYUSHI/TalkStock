//
//  TopicList+Action.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/02.
//

import SwiftUI

struct TopicListAction: View {
    
    
    var action: ()->Void
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(memoTitles) { memoTitle in
                    Button(action: {
                        action()
                    }) {
                        TopicCell(title: memoTitle.title)
                    }
                }
            }
        }
    }
}

struct TopicListAction_Previews: PreviewProvider {
    static var previews: some View {
        TopicListAction(action: {})
    }
}
