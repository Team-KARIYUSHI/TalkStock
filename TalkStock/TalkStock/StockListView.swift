//
//  StockListView.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/25.
//

import SwiftUI

struct StockListView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State var searchItem = ""
    @State var modalOpened = false
    
    init() {
        setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        TextField("タグ検索", text: $searchItem)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: screenWidth / 1.3, height: screenWidth / 5)
                        Button(action: {
                            //検索
                        }) {
                            Image("検索アイコン")
                                .resizable()
                                .frame(width: screenWidth / 13, height: screenWidth / 13)
                        }
                    }
                    
                    Divider()
                        .background(Color.black)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Spacer()
                }
                .navigationBarTitle("ストック", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.modalOpened.toggle()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: screenWidth / 20, height: screenWidth / 20)
                }).sheet(isPresented: $modalOpened) {
                    MemoCreateView()
                }
            }
        }
    }
}
//ナビゲーションバー色指定
//※後でヘルパークラスへ移動させる
func setupNavigationBar() {
    UINavigationBar.appearance().tintColor = .systemGray6
    UINavigationBar.appearance().barTintColor = .systemTeal
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
