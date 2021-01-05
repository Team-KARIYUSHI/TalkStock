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
    
    init() {
        // UIComponents構造体（ヘルパークラス）から利用する
        UIComponents.setupNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            
            
                
                VStack {
                    SearchHeader(searchItem: $searchItem)
                    
                    Spacer()
                    
                    StockListScroll()
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity,
                       alignment: .center)
                .background(Color(#colorLiteral(red: 0.7083092332, green: 0.8691392541, blue: 0.9798682332, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
                
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


struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        StockListView()
    }
}
