//
//  StockCell.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/26.
//

import SwiftUI

struct StockCell: View {
    
    var memoTitle: String
    
    var body: some View {
        
        VStack(spacing: -10) {
            Text(memoTitle)
                .font(.system(size: UIComponents.screenWidth / 20))
                .foregroundColor(Color.black)
                .frame(width: UIComponents.screenWidth / 1.2,height: UIComponents.screenWidth / 7, alignment: .topLeading)
                .padding()
            //ここにタグを表示
            TagButton()
                .frame(width: UIComponents.screenWidth / 1.2, alignment: .leading)
                .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCell(memoTitle: "")
    }
}
