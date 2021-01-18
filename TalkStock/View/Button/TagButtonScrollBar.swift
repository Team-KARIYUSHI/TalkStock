//
//  TagButtonScrollBar.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/17.
//

import SwiftUI

struct TagButtonScrollBar: View {
    
    @Binding var selected: Int
    var color: Color
    
    @ObservedObject var tagbuttonScrollBarVM = TagButtonScrollBarViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { value in
                HStack {
                    ForEach(0..<memoTitles.count) { i in
                        TagButton(selected: self.$selected,
                                  index: i,
                                  tagName: memoTitles[i].tag,
                                  color: color) { // タグ名はRealmから取得してきた値を入れる
                            value.scrollTo(i, anchor: .center)
                            // ここで検索処理をする
                        }
                    }
                }
            }
        }.padding()
    }
}

struct TagButtonScrollBar_Previews: PreviewProvider {
    static var previews: some View {
        TagButtonScrollBar(selected: .constant(0), color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
    }
}
