//
//  TopicList+Action.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/02/02.
//

import SwiftUI

struct TopicListAction: View {
    
    var height: CGFloat
    var action: ()->Void
    
    @State private var selectionItems: Set<Int> = []
    
    var body: some View {
        LazyVStack {
            List(selection: $selectionItems) {
                ForEach(memoTitles) { memoTitle in
                    Button(action: {
                        action()
                    }) {
                        TopicCell(title: memoTitle.title)
                    }
                }
            }.environment(\.editMode, .constant(.active))
            .frame(height: height)
        }
    }
}

struct TopicListAction_Previews: PreviewProvider {
    static var previews: some View {
        TopicListAction(height: UIComponents.screenHeight, action: {})
    }
}
