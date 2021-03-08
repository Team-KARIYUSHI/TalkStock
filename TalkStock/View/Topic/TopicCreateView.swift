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
    @State var showingAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var topicCreateVM = TopicCreateViewModel()
    
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
                    
                    if topicCreateVM.relationship.count == 0 {
                        Text("")
                            .padding(.bottom, 20)
                    } else {
                        VStack(alignment: .leading) {
                            Text("話したい人").font(.caption)
                            // TODO: personSummaryは後で変更予定
                            PersonCollection(isPresented: self.$modalOpened,
                                             personSummary: personSummary)
                        }
                    }
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .center)
                
                SaveButton(title: "登録",
                           action: {
                            self.showingAlert = true
                           },isDisabled: title.isEmpty || tag.isEmpty)
                    .alert(isPresented: self.$showingAlert) {
                        Alert(title: Text("登録内容確認"),
                              message: Text("登録してもよろしいですか？\nタイトル：\(title)\n会話タグ：\(tag)"),
                              primaryButton: .destructive(Text("キャンセル")),
                              secondaryButton: .default(Text("OK")) {
                                topicCreateVM.create(topic: Topic(value:
                                                                    ["title":self.title,
                                                                     "memo":self.text,
                                                                     "url":self.url]),
                                                     topicTagName: self.tag) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                              })
                    }
                
                Text("")
                    .alert(item: self.$topicCreateVM.alertItem) { item in
                        item.alert
                    }
            }
            .padding()
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
