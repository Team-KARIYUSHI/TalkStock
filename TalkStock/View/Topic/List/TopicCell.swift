//
//  StockCell.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/26.
//

import SwiftUI

struct TopicCell: View {
    
    var title: String
    
    var body: some View {
        
        VStack(spacing: -10) {
            Text(title)
                .font(.system(size: UIComponents.screenWidth / 20))
                .foregroundColor(Color.black)
                .frame(width: UIComponents.screenWidth / 1.2,height: UIComponents.screenWidth / 7, alignment: .topLeading)
                .padding()
            
            HStack {
                TagText()
                    .padding(.leading, 30)
                Spacer()
                Text("作成日：\(GetDate.getToday())")
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .padding(.trailing, 30)
                
            }
        }
        .frame(width: UIComponents.screenWidth / 1.1,
               height: UIComponents.screenWidth / 3)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct TopicCell_Previews: PreviewProvider {
    static var previews: some View {
        TopicCell(title: "")
    }
}
