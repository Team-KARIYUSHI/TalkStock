//
//  PersonCollection.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/13.
//

import SwiftUI

struct PersonCollection: View {
    
    @Binding var isPresented: Bool
    var personSummary: [PersonSummary]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                PlusCircleButton(isPresented: self.$isPresented,
                                 view: PersonListModalView())
                // 後で話したい人選択画面に差し替える
                ForEach(personSummary) { personSummary in
                    NavigationLink(destination: EmptyView()) {
                        PersonButton(personName: personSummary.name,
                                     action: {
                                        
                                     })
                    }
                }
            }.frame(height:100)
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 100)
    }
}

struct PersonCollection_Previews: PreviewProvider {
    static var previews: some View {
        PersonCollection(isPresented: .constant(false), personSummary: personSummary)
    }
}
