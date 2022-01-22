//
//  PersonList+Move.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/09.
//

import SwiftUI
import RealmSwift

struct PersonListMove: View {
    
    @State private var tabBar: UITabBar! = nil
    var height: CGFloat
    var relationshipData: RelationshipData?
    
    var body: some View {
        if let relationship = relationshipData {
            // 検索結果があればリストを表示する
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(relationship.talkPartners, id:\.id) { talkPartner in
                        NavigationLink(destination: ProfileDetailView(relationship: relationship, talkpartner: talkPartner)
                                        .onAppear { self.tabBar.isHidden = true }
                                        .onDisappear { self.tabBar.isHidden = false }
                        ) {
                            PersonCell(relationshipData: relationship ,
                                       talkpartner: talkPartner)
                        }
                    }.padding(.all, 1)
                }
                .frame(width: UIComponents.screenWidth)
                .padding(.bottom, 100)
                .background(TabBarAccessor { tabbar in
                    self.tabBar = tabbar
                })
            }.frame(height: height)
        } else {
            // 検索結果がなければNoDataを出す
            EmptyStateView(imageName: EmptyState.noPerson.setImageName,
                           color: Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
        }
    }
}


struct PersonListMove_Previews: PreviewProvider {
    static var previews: some View {
        PersonListMove(height: UIComponents.screenHeight - 170, relationshipData: nil)
    }
}
