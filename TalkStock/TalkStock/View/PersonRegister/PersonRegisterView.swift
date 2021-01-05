//
//  PersonRegisterView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/05.
//

import SwiftUI

struct PersonRegisterVIew: View {
    
    @State var personName = ""
    @State var relationship = ""
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: UIComponents.screenWidth / 1.7, height: UIComponents.screenWidth / 1.7)
                    TextField("名前", text: $personName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: UIComponents.screenWidth / 2)
                }
                
                VStack(alignment: .leading) {
                    Text("関係")
                    TextField("例：友達", text: $relationship)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: UIComponents.screenWidth / 1.1)
                    
                    Text("会話ネタ")
                        .padding(.vertical)
                    
                    Button(action: {}) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: UIComponents.screenWidth / 10, height: UIComponents.screenWidth / 10)
                            .foregroundColor(.black)
                    }
                }
                
                Button(action: {}) {
                    Text("登録する")
                        .frame(width: UIComponents.screenWidth / 1.5, height: UIComponents.screenWidth / 10)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            
            .navigationBarTitle("新規作成", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {}) {
                
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width:  UIComponents.screenWidth / 20,
                           height:  UIComponents.screenWidth / 20)
                    .foregroundColor(.black)
            })
        }
    }
}

struct PersonRegisterVIew_Previews: PreviewProvider {
    static var previews: some View {
        PersonRegisterVIew()
    }
}
