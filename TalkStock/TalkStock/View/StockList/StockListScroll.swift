//
//  StockListScroll.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct StockListScroll: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(memoTitles) { memoTitle in
                    NavigationLink(destination: MemoCreateView()) {
                        StockCell(memoTitle: memoTitle.title)
                    }
                }
            }
        }
    }
}

struct StockListScroll_Previews: PreviewProvider {
    static var previews: some View {
        StockListScroll()
    }
}
