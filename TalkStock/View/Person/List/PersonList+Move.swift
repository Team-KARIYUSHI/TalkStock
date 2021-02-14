//
//  PersonList+Move.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/09.
//

import SwiftUI

struct PersonListMove: View {
    
    @State private var tabBar: UITabBar! = nil
    var height: CGFloat
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(personSummary) { personSummary in
                    NavigationLink(destination: ProfileView()
                                    .onAppear { self.tabBar.isHidden = true }
                                    .onDisappear { self.tabBar.isHidden = false }
                    ) {
                        PersonCell(person: personSummary)
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


struct PersonListMove_Previews: PreviewProvider {
    static var previews: some View {
        PersonListMove(height: UIComponents.screenHeight - 170)
    }
}
