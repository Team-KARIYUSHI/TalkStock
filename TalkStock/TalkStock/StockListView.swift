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
        // UIComponents構造体（ヘルパークラス）から利用する
        UIComponents.setupNavigationBar()
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
                            .frame(width: UIComponents.screenWidth / 1.3,
                                   height:  UIComponents.screenWidth / 5)
                        Button(action: {
                            //検索
                        }) {
                            Image("検索アイコン")
                                .resizable()
                                .frame(width:  UIComponents.screenWidth / 13,
                                       height:  UIComponents.screenWidth / 13)
                        }
                    }
                    
                    Divider()
                        .background(Color.black)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(0...4, id: \.self) { _ in
                                NavigationLink(destination: MemoCreateView()) {
                                    StockCell()
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("ストック", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.modalOpened.toggle()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width:  UIComponents.screenWidth / 20,
                               height:  UIComponents.screenWidth / 20)
                }).sheet(isPresented: $modalOpened) {
                    MemoCreateView()
                }
            }
        }
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
