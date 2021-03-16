//
//  PersonRegisterView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/05.
//

import SwiftUI
import RealmSwift

struct PersonCreateView: View {
    
    // 画像選択時にUIImage型にする
    @State var inputImage: UIImage? = UIImage(named: "person.circle")
    // 画像選択後に表示する。SwiftUI側で画像表示するためにImageを使う
    @State var image = Image(systemName: "person.circle")
    
    // テキストフィールドのプロパティ
    @State var name = ""
    @State var relationship = ""
    
    // モーダルフラグ
    @State var modalOpened = false
    
    // 画像選択アクションシート
    @State var showActionSheet = false
    @State var showCamera = false
    @State var showPhotoLibrary = false
    
    // 確認用アラートフラグ
    @State var showingAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var personCreateVM = PersonCreateViewModel()
    
    init() {
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack {

                            SelectImageButton(showingActionSheet: self.$showActionSheet,
                                              showingCamera: self.$showCamera,
                                              showingPhotoLibrary: self.$showPhotoLibrary,
                                              inputImage: self.$inputImage,
                                              image: self.$image)
                            
                            HStack(spacing: 20) {
                                Text("名前")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.5))
                                
                                TextField("例：山田太郎", text: $name)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: UIComponents.screenWidth / 2)
                                    .padding(.trailing, 50)
                            }
                            
                            VStack(alignment: .leading) {
                                HStack(spacing: 20) {
                                    Text("関係")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black.opacity(0.5))
                                    
                                    TextField("例：友達", text: $relationship)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(width: UIComponents.screenWidth / 2)
                                        .padding(.trailing, 50)
                                }.padding(.bottom)
                                
                                if personCreateVM.topic.count == 0 {
                                    Text("")
                                        .padding(.bottom, 20)
                                } else {
                                    VStack {
                                        Text("会話ネタ")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.black.opacity(0.5))
                                        PlusCircleButton(isPresented: self.$modalOpened,
                                                         view: TopicModalView())
                                    }
                                }
                                
                            }
                        }
                    }
                    .frame(width: UIComponents.screenWidth)
                    .padding(.top, 100)
                }
                
                VStack {
                    Spacer()
                    SaveButton(title: "登録",
                               action: {
                                self.showingAlert = true
                               },
                               isDisabled: name.isEmpty || relationship.isEmpty)
                        
                        .alert(isPresented: self.$showingAlert) {
                            Alert(title: Text("登録内容確認"),
                                  message: Text("登録してもよろしいですか？\n名前：\(name)\n関係タグ：\(relationship)"),
                                  primaryButton: .destructive(Text("キャンセル")),
                                  secondaryButton: .default(Text("OK")) {
                                    // Realmに保存するパラメータをRequestクラスに一旦集める
                                    let request = TalkpartnerRequest(relationName: self.relationship,
                                                                     talkpartner: Talkpartners(value: ["personalName":self.name,
                                                                                                       "image":RealmHelper.resizeImage(originalImg: self.inputImage ?? UIImage(), width: 200)]),
                                                                     topics: personCreateVM.topic)
                                    personCreateVM.create(request) {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                            })
                        }

                    Text("")
                        .alert(item: self.$personCreateVM.alertItem) { item in
                            item.alert
                        }
                    
                }.padding(.bottom)

            }
            .navigationBarTitle("新規登録", displayMode: .inline)
            .navigationBarItems(leading: XmarkButton(action:{
                self.presentationMode.wrappedValue.dismiss()
            }))
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct PersonCreateView_Previews: PreviewProvider {
    static var previews: some View {
        PersonCreateView()
    }
}
