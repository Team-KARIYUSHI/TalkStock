//
//  PersonListScroll.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/09.
//

import SwiftUI

struct PersonListScroll: View {
    
    var height: CGFloat
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(personSummary) {
                    personSummary in NavigationLink(destination: EmptyView()) {
                        PersonCell(personName: personSummary.personName,
                                   relationship: personSummary.relationship,
                                   stockNum: personSummary.stockNum)
                    }
                }.padding(.all, 1)
            }
            .frame(width: UIComponents.screenWidth)
            .padding(.bottom, 100)
        }.frame(height: height)
    }
}

struct PersonListScroll_Previews: PreviewProvider {
    static var previews: some View {
        PersonListScroll(height: UIComponents.screenHeight - 170)
    }
}
