//
//  ProfileDetailView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/19.
//

import SwiftUI

struct ProfileDetailView: View {
    
    @State var modalOpened = false
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        
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
                        
                        Text("友達")
                            .font(.title2)
                            .frame(width: UIComponents.screenWidth / 1.4,
                                   alignment: .leading)
                    }
                    Text("会話ネタ")
                        .padding(.vertical)
                    
                    StockListOnly()
                }
                
                SaveButton(title: "編集",
                           action: {
                            // ここに登録処理
                           }).padding(.vertical)
            }
            .frame(width: UIComponents.screenWidth)
            .padding(.top, 100)
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .center)
        .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        
        .navigationBarTitle("愛知太郎", displayMode: .inline)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
