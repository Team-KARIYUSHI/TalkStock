//
//  MemoRegisterView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/25.
//

import SwiftUI

struct MemoCreateView: View {
    
    @State var memoTitle = ""
    @State var memoTag = ""
    @State var memoText = ""
    @State var memoUrl = ""
    @State var modalOpened = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer().frame(height: 60)
                VStack(alignment: .leading) {
                    Group {
                        Text("タイトル").font(.caption)
                        TextField("", text: $memoTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: UIComponents.screenWidth / 1.1, height: UIComponents.screenWidth / 12)
                        
                        Text("タグ").font(.caption)
                        TextField("", text: $memoTag)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: UIComponents.screenWidth / 1.1, height: UIComponents.screenWidth / 12)
                        Text("メモ").font(.caption)
                        MultilineTextField(text: $memoText)
                            .frame(width: UIComponents.screenWidth / 1.1, height: UIComponents.screenWidth / 2.5)
                            .border(Color(#colorLiteral(red: 0.7999121547, green: 0.8000506759, blue: 0.7999034524, alpha: 1)), width: 0.5)
                            .cornerRadius(10)
                        
                        Text("URL :").font(.caption)
                        MultilineTextField(text: $memoUrl)
                            .frame(width: UIComponents.screenWidth / 1.1, height: UIComponents.screenWidth / 5)
                            .border(Color(#colorLiteral(red: 0.7999121547, green: 0.8000506759, blue: 0.7999034524, alpha: 1)), width: 0.5)
                            .cornerRadius(10)
                    }
                  
                    VStack(alignment: .leading) {
                        Text("話したい人")
                            .font(.caption)
                        
                    Button(action: {
                        self.modalOpened.toggle()
                    }) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: UIComponents.screenWidth / 10, height: UIComponents.screenWidth / 10)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.vertical, 20)
                    .sheet(isPresented: $modalOpened) {
                        PersonRegisterVIew()
                    }

                }
                
                Button(action: {}) {
                    Text("保存する")
                        .frame(width: UIComponents.screenWidth - 50, height: UIComponents.screenWidth / 9)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                }.cornerRadius(20)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("新規作成", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width:  UIComponents.screenWidth / 20,
                           height:  UIComponents.screenWidth / 20)
                    .foregroundColor(.black)
            })
        }
    }
}


struct MemoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        MemoCreateView()
    }
}
