//
//  SearchHeader.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct SearchHeader: View {
    
    @Binding var searchItem: String
    
    var body: some View {
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
        }
    }
}

struct SearchHeader_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeader(searchItem: .constant(""))
    }
}
