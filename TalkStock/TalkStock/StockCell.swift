//
//  StockCell.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/26.
//

import SwiftUI

struct StockCell: View {
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: UIComponents.screenWidth / 1.1, height: UIComponents.screenWidth / 3)
                .cornerRadius(10)
                .foregroundColor(.white)
            
            VStack {
                Text("スタバ「大学芋フラペチーノ」を発売!")
                    .font(.system(size: UIComponents.screenWidth / 20))
                    .foregroundColor(Color.black)
                    .frame(width: UIComponents.screenWidth / 1.2,height: UIComponents.screenWidth / 7, alignment: .topLeading)
                    .padding()
                
                //ここにタグを表示
                Text("タグ表示")
                    .frame(width: UIComponents.screenWidth / 1.2, alignment: .leading)
            }
        }
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCell()
    }
}
