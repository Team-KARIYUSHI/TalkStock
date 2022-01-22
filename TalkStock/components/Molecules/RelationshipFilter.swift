//
//  PersonTagButtonScrollBar.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/18.
//

import SwiftUI
import RealmSwift

struct RelationshipFilter: View {
    @Binding var selected: Int
    var color: Color
    // タグボタンになるモデルを取得する
    var tagNames: RealmSwift.Results<Relationship>
    var action:()->Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { value in
                HStack {
                    ForEach(0..<tagNames.count){ i in
                        TagButton(selected: self.$selected,
                                  index: i,
                                  tagName: tagNames[i].relationName,
                                  color: color) { // タグ名はRealmから取得してきた値を入れる
                            value.scrollTo(i, anchor: .center)
                            // ここで検索処理をする
                            action()
                        }
                    }
                }
            }
        }.padding()
    }
}

struct RelationshipFilter_Previews: PreviewProvider {
    static var previews: some View {
        let results = try! Realm().objects(Relationship.self)
        RelationshipFilter(selected: .constant(0),
                           color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
                           tagNames: results,
                           action: {})
    }
}
