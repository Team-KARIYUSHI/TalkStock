//
//  PersonList+Action.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/29.
//

import SwiftUI

struct PersonListAction: View {
    var height: CGFloat
    var relationshipData: RelationshipData?
    var talkpartner: Talkpartners?
    var action: ()->Void
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(relationshipData!.talkPartners, id:\.id) { talkpartner in
                    Button(action: {
                        action()
                    }) {
                        PersonCell(relationshipData: relationshipData,
                                   talkpartner: talkpartner)
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
