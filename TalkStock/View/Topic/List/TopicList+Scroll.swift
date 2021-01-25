//
//  StockListScroll.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct TopicListScroll: View {
    
    var height: CGFloat
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                TopicList()
                    .padding(.bottom, 100)
            }.frame(height: height)
        }
    }
}

struct TopicListScroll_Previews: PreviewProvider {
    static var previews: some View {
        TopicListScroll(height: UIComponents.screenHeight - 170)
    }
}
