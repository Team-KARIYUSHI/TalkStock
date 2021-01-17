//
//  PersonRegisterView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/05.
//

import SwiftUI

struct PersonRegisterView: View {
    
    @State var personName = ""
    @State var relationship = ""
    @State var modalOpened = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: UIComponents.screenWidth / 2,
                               height: UIComponents.screenWidth / 2)
                    TextField("名前", text: $personName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: UIComponents.screenWidth / 1.1)
                }.padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("関係")
                    TextField("例：友達", text: $relationship)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: UIComponents.screenWidth / 1.1)
                    
                    Text("会話ネタ")
                        .padding(.vertical)
                    
                    PlusCircleButton(isPresented: self.$modalOpened,
                                     view: EmptyView()) // 後で会話ネタ選択画面に差し替える
                    
                }
                
                SaveButton(title: "登録",
                           action: {
                            // ここに登録処理
                           })
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            
            .navigationBarTitle("新規登録", displayMode: .inline)
            .navigationBarItems(leading:
                XmarkButton(action:{
                    self.presentationMode.wrappedValue.dismiss()
                })
            )
        }
    }
}

struct PersonRegisterVIew_Previews: PreviewProvider {
    static var previews: some View {
        PersonRegisterView()
    }
}
