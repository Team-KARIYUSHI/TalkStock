//
//  PersonalView.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct PersonalListView: View {
    
    @State var title: String = ""
    @State var isLoading: Bool = true
    @State var modalOpened: Bool = false
    
    @State var searchItem: String = ""
    @State var selected: Int = 0
    
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
    
    var body: some View {
        LoadingView(title: $title,
                    isShowing: $isLoading) {
                VStack {
                    SearchHeader(searchItem: self.$searchItem, placeholder: "関係検索")
                        .padding(.top, UIComponents.screenHeight / 5.5)
                    PersonRelationshipButtonScrollBar(selected: self.$selected,
                                                      color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                    PersonListScroll(height: PersonListSize.tabBar.setHeight)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .center)
                .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("パーソナル", displayMode: .inline)
                .navigationBarItems(trailing:
                    PlusButton(isPresented: self.$modalOpened,view: PersonRegisterView())
                )
                .onAppear() {
                    self.loading()
                }
        }
    }
}

struct PersonalListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalListView()
    }
}
