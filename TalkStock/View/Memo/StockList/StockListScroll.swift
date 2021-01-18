//
//  StockListScroll.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct StockListScroll: View {
    
    var height: CGFloat
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(memoTitles) { memoTitle in
                    NavigationLink(destination: EmptyView()) { // 後で会話ネタ詳細画面に差し替える
                        StockCell(memoTitle: memoTitle.title)
                    }
                }
            }
            .frame(width: UIComponents.screenWidth)
            .padding(.bottom, 100)
        }.frame(height: height)
        
    }
}

struct StockListScroll_Previews: PreviewProvider {
    static var previews: some View {
        StockListScroll(height: UIComponents.screenHeight - 170)
    }
}
