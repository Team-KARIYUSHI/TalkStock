//
//  PersonVerticalScroll.swift
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
            HStack {
                PlusCircleButton(isPresented: self.$isPresented,
                                    view: PersonListModalView())
                // 後で話したい人選択画面に差し替える
                ForEach(personSummary) { personSummary in
                    NavigationLink(destination: EmptyView()) {
                        PersonButton(personName: personSummary.personName,
                                     action: {
                                        
                                     })
                    }
                }
            }.frame(height:100)
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
                maxHeight: 100)
        .padding()
    }
}

struct PersonCollection_Previews: PreviewProvider {
    static var previews: some View {
        PersonCollection(isPresented: .constant(false), personSummary: personSummary)
    }
}
