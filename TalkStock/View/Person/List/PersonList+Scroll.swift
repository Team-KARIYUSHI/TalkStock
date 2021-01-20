//
//  PersonListScroll.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/09.
//

import SwiftUI

struct PersonListScroll: View {
    
    @State private var tabBar: UITabBar! = nil
    var height: CGFloat
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(personSummary) { personSummary in
                    NavigationLink(destination: ProfileView()
                        .onAppear { self.tabBar.isHidden = true }
                        .onDisappear { self.tabBar.isHidden = false }
                    ) {
                        PersonCell(name: personSummary.personName,
                                   relationship: personSummary.relationship,
                                   topicNum: personSummary.stockNum)
                    }
                }.padding(.all, 1)
            }
            .frame(width: UIComponents.screenWidth)
            .padding(.bottom, 100)
            .background(TabBarAccessor { tabbar in
                        self.tabBar = tabbar
                    })
        }.frame(height: height)
    }
}


struct PersonListScroll_Previews: PreviewProvider {
    static var previews: some View {
        PersonListScroll(height: UIComponents.screenHeight - 170)
    }
}
