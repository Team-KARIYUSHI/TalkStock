//
//  PersonTagButtonScrollBar.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/18.
//

import SwiftUI

struct RelationshipFilter: View {
    @Binding var selected: Int
    var color: Color
    
    @ObservedObject var relationshipFilterVM = RelationshipFilterViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { value in
                HStack {
                    ForEach(0..<relationshipFilterVM.personData!.count) { i in
                        TagButton(selected: self.$selected,
                                  index: i,
                                  tagName: relationshipFilterVM.personData![i].relationship,
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

struct RelationshipFilter_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipFilter(selected: .constant(0), color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
    }
}
