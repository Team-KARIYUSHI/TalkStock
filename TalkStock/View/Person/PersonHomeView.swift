//
//  PersonHomeView.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI
import RealmSwift

struct PersonHomeView: View {
    
    @State var title: String = ""
    @State var isLoading: Bool = true
    @State var modalOpened: Bool = false
    
    @State var searchItem: String = ""
    @State var selected: Int = 0
    
    // タグボタン用にボタン名を取得してくる
    var tagNames = try! Realm().objects(Relationship.self)
    
    @ObservedObject var personHomeVM = PersonHomeViewModel()
    
    /// LoadingViewをPersonalViewの前に出した時に発動するメソッド
    func loading() {
        self.title = "読込中..."
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.processing()
        }
    }
    
    /// LoadingViewを閉じる直前に発動するメソッド
    func processing() {
        self.title = "展開中..."
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isLoading = false
        }
    }
    
    init() {
        // UIComponents構造体（ヘルパークラス）から利用する
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            LoadingView(title: $title,
                        isShowing: $isLoading) {
                VStack {
                    SearchHeader(searchItem: self.$searchItem, placeholder: "関係検索")
                        .padding(.top, UIComponents.screenHeight / 5.5)
                    RelationshipFilter(selected: self.$selected,
                                       color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
                                       tagNames: tagNames) {
                        personHomeVM.filter(tagNames[selected].relationName)
                    }
                    PersonListMove(height: PersonListSize.tabBar.setHeight,
                                   relationshipData: personHomeVM.myRelationships[0])
                    
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .center)
                .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("話したい人", displayMode: .inline)
                .navigationBarItems(trailing:
                                        PlusButton(isPresented: self.$modalOpened,view: PersonCreateView())
                )
                .onAppear() {
                    self.loading()
                }
            }
        }
    }
}




struct PersonHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PersonHomeView()
    }
}
