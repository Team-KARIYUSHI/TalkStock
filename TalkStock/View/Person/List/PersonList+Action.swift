//
//  PersonList+Action.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/29.
//

import SwiftUI

struct PersonListAction: View {
    var height: CGFloat
    var action: ()->Void
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(personSummary) { personSummary in
                    Button(action: {
                        action()
                    }) {
                        PersonCell(person: personSummary)
                    }
                }.padding(.all, 1)
            }
            .frame(width: UIComponents.screenWidth)
            .padding(.bottom, 100)
        }.frame(height: height)
    }
}

struct PersonModalList_Previews: PreviewProvider {
    static var previews: some View {
        PersonListAction(height: UIComponents.screenHeight - 170, action: {})
    }
}
