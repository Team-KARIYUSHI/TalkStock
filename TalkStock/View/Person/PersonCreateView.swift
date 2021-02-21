//
//  PersonRegisterView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/05.
//

import SwiftUI
import RealmSwift

struct PersonCreateView: View {
    
    @State var inputImage: UIImage? = UIImage(named: "person.circle")
    @State var image = Image(systemName: "person.circle")
    @State var name = ""
    @State var relationship = ""
    @State var modalOpened = false
    
    @State var showActionSheet = false
    @State var showCamera = false
    @State var showPhotoLibrary = false
    
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
                                
                                if personCreateVM.topicTag.count == 0 {
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
                                Relationship.add(talkPartners: TalkPertners(value: ["personalName":self.name,"image":self.inputImage?.pngData() ?? Data()]),
                                                 relationshipName: self.relationship)
                               },isDisabled: name.isEmpty || relationship.isEmpty)
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