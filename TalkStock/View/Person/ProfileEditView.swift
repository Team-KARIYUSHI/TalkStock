//
//  ProfileEditView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/23.
//

import SwiftUI
import RealmSwift

struct ProfileEditView: View {
    
    @State var name = ""
    @State var relationName = ""
    @State var modalOpened = false
    
    var relationship: RelationshipData?
    var talkpartner: Talkpartners?
    
    @State var showAlert = false
    @State var alertItem: AlertItem? = nil
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var loginState: LoginState
    
    @ObservedObject var personEditVM = PersonEditViewModel(service: PersonEditService())
    
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        VStack {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: UIComponents.screenWidth / 2,
                                       height: UIComponents.screenWidth / 2)
                            
                            HStack(spacing: 20) {
                                Text("名前")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.5))
                                
                                TextField("例：山田太郎", text: $name)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: UIComponents.screenWidth / 2)
                                    .padding(.trailing, 50)
                            }
                            
                            HStack(spacing: 20) {
                                Text("関係")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.5))
                                
                                TextField("例：友達", text: $relationName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: UIComponents.screenWidth / 2)
                                    .padding(.trailing, 50)
                            }
                            
                            VStack(alignment: .leading) {
                                VStack {
                                    Text("会話ネタ")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black.opacity(0.5))
                                    
                                    PlusCircleButton(isPresented: self.$modalOpened,
                                                     view: TopicModalView())
                                }
                                TopicList()
                                    .padding(.bottom, 70)
                                
                            }.padding(.top)
                        }
                    }
                    .frame(width: UIComponents.screenWidth)
                    .padding(.top, 100)
                }
                
                VStack {
                    Spacer()
                    SaveButton(title: "更新",
                               action: {
                                // ここに更新処理
                               }).padding(.bottom)
                }
            }
            .navigationBarTitle("プロフィール編集", displayMode: .inline)
            .navigationBarItems(leading: XmarkButton(action:{
                self.presentationMode.wrappedValue.dismiss()
            }),trailing: DeleteButton(action: {
                // 削除確認アラートオブジェクトを用意する
                self.alertItem = AlertItemType.confirmDelete.switchDeleteAlert {
                    // 削除実行したときに削除完了or削除失敗オブジェクトを用意する
                    self.alertItem = self.personEditVM.delete(object: talkpartner) {
                        // 削除完了したらホームに戻る
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            NotificationCenter.default.post(name:NSNotification.Name("home"),
                                                            object: nil)
                        }
                        // ホームに戻ったときにロック解除する
                        self.loginState.isUnlocked = true
                        NotificationCenter.default.removeObserver(self)
                    }
                }
                
            }).padding(.bottom, 1)
            .alert(item: self.$alertItem) { item in
                item.alert
            }
            ).frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .onAppear(){
                self.name = talkpartner?.personalName ?? ""
                self.relationName = relationship?.relationName ?? ""
            }
        }
    }
}

enum AlertItemType {
    case confirmDelete
    case completeDelete
    case failedDelete
    
    func switchDeleteAlert(completion: @escaping()->Void) -> AlertItem {
        switch self {
        case .confirmDelete:
            return AlertItem(alert: Alert(title: Text("削除確認"),
                                          message: Text("削除してもよろしいですか？"),
                                          primaryButton: .default(Text("OK")){completion()},
                                          secondaryButton: .cancel()))
        case .completeDelete:
            return AlertItem(alert: Alert(title: Text("削除完了"),
                                          message: Text("削除しました"),
                                          dismissButton: .default(Text("OK")){completion()}))
        case .failedDelete:
            return AlertItem(alert: Alert(title: Text("削除失敗"),
                                          message: Text("削除に失敗しました"),
                                          dismissButton: .default(Text("OK"))))
        }
    }
}

class PersonEditViewModel: ObservableObject {
    
    var service: PersonEditProtocol
    
    init(service: PersonEditProtocol) {
        self.service = service
    }
    
    func delete(object: Talkpartners?, handler: @escaping()->Void) -> AlertItem {
        if service.delete(object: object) {
            return AlertItemType.completeDelete.switchDeleteAlert(completion: handler)
        } else {
            return AlertItemType.failedDelete.switchDeleteAlert(completion: {})
        }
    }
    
}

protocol PersonEditProtocol {
    func delete(object: Talkpartners?) -> Bool
}

class PersonEditService: PersonEditProtocol {
    func delete(object: Talkpartners?) -> Bool {
       guard let result = object else {return false}
        let realm = try! Realm()
        do {
            try realm.write { realm.delete(result) }
            return true
        } catch {
            print(error)
            return false
        }
    }
}


class LoginState: ObservableObject {
    // アプリ起動時のロック解除フラグ
    @Published var isUnlocked: Bool = false
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}
