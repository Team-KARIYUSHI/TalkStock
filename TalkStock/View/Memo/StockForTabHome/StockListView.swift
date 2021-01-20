//
//  StockListView.swift
//  TalkStockTest
//
//  Created by 久富稜也 on 2020/12/26.
//

import SwiftUI


struct StockListView: View {
    
    
    @State var searchItem = ""
    @State var modalOpened = false
    @State var selected = 0
    
    init() {
        // UIComponents構造体（ヘルパークラス）から利用する
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
            VStack {
                SearchHeader(searchItem: $searchItem,
                             placeholder: "タグ検索")
                    .padding(.top, UIComponents.screenHeight / 5.5)
                TagButtonScrollBar(selected: self.$selected,
                                   color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                StockListScroll(height: StockListSize.tabBar.setHeight)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity,
                   alignment: .center)
            .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("ストック", displayMode: .inline)
            .navigationBarItems(trailing:
                                    PlusButton(isPresented: self.$modalOpened,
                                               view: MemoCreateView()))
    }
}


struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
