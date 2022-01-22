//
//  ProfileDetailView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/19.
//

import SwiftUI

struct ProfileDetailView: View {
    
    @State var modalOpened = false
    var relationship: RelationshipData?
    var talkpartner: Talkpartners?
    
    init(relationship: RelationshipData?, talkpartner: Talkpartners?) {
        UIComponents.setupNavigationBar()
        self.relationship = relationship
        self.talkpartner = talkpartner
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: UIComponents.screenWidth / 2,
                                   height: UIComponents.screenWidth / 2)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("関係")
                            
                            Text(relationship?.relationName ?? "")
                                .font(.title2)
                                .frame(width: UIComponents.screenWidth / 1.4,
                                       alignment: .leading)
                        }
                        Text("会話ネタ")
                            .padding(.vertical)
                        
                        TopicList()
                            .padding(.bottom, 70)
                    }
                }
                .frame(width: UIComponents.screenWidth)
                .padding(.top, 100)
            }
            
            VStack {
                Spacer()
                SaveButton(title: "編集",
                           action: {
                            self.modalOpened.toggle()
                           }).sheet(isPresented: $modalOpened) {
                            ProfileEditView(relationship: relationship, talkpartner: talkpartner)
                    }
                    .padding(.bottom)
            }
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .center)
        .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        
        .navigationBarTitle(talkpartner?.personalName ?? "", displayMode: .inline)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(relationship: nil, talkpartner: nil)
    }
}
