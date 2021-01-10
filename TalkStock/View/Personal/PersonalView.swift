//
//  PersonalView.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct PersonalView: View {
    
    @State var title: String = ""
    @State var isLoading: Bool = true
    @State var modalOpened: Bool = false
    
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
            NavigationView {
                VStack {
                    Text("パーソナル画面")
                }
                .navigationBarTitle("パーソナル", displayMode: .inline)
                .navigationBarItems(trailing:
                    PlusButton(isPresented: self.$modalOpened,view: PersonRegisterView())
                )
            }.onAppear() {
                self.loading()
            }
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView()
    }
}
