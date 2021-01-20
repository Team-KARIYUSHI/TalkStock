//
//  MemoRegisterView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/25.
//

import SwiftUI

struct TopicCreateView: View {
    
    @State var title = ""
    @State var tag = ""
    @State var text = ""
    @State var url = ""
    @State var modalOpened = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                Spacer().frame(height: 80)
                VStack(alignment: .leading) {
                    Group {
                        Text("タイトル").font(.caption)
                        TextField("", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: UIComponents.screenWidth / 1.1,
                                   height: UIComponents.screenWidth / 12)
                        
                        Text("タグ").font(.caption)
                        TextField("", text: $tag)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: UIComponents.screenWidth / 1.1,
                                   height: UIComponents.screenWidth / 12)
                        Text("メモ").font(.caption)
                        MultilineTextField(text: $text)
                            .frame(width: UIComponents.screenWidth / 1.1,
                                   height: UIComponents.screenWidth / 2.5)
                            .border(Color(#colorLiteral(red: 0.7999121547, green: 0.8000506759, blue: 0.7999034524, alpha: 1)), width: 0.5)
                            .cornerRadius(10)
                        
                        Text("URL :").font(.caption)
                        MultilineTextField(text: $url)
                            .frame(width: UIComponents.screenWidth / 1.1,
                                   height: UIComponents.screenWidth / 5)
                            .border(Color(#colorLiteral(red: 0.7999121547, green: 0.8000506759, blue: 0.7999034524, alpha: 1)), width: 0.5)
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("話したい人")
                            .font(.caption)
                        
                        // TODO: personSummaryは後で変更予定
                        PersonCollection(isPresented: self.$modalOpened,
                                             personSummary: personSummary)
                    }
                }
                
                SaveButton(title: "登録",
                           action: {
                            // ここに登録処理
                           })
                    .padding(.bottom, 30)
            }
            .padding()
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("新規作成", displayMode: .inline)
            .navigationBarItems(leading:
                                    XmarkButton(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    })
            )
        }
    }
}


struct TopicCreateView_Previews: PreviewProvider {
    static var previews: some View {
        TopicCreateView()
    }
}
