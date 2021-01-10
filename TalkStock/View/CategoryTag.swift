//
//  CategoryTag.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/27.
//

import SwiftUI

struct CategoryTag: View {
    
    var tags = ["グルメ","趣味","カフェ","おもしろ"]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(tags, id: \.self){tag in
                    Button(action: {}) {
                        HStack {
                            Text(tag)
                                .font(.footnote)
                        }
                    }
                    .padding()
                    
                    .foregroundColor(.black)
                    .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                    .frame(height: UIComponents.screenWidth / 15)
                    .cornerRadius(30)
                    .lineLimit(1)
                }
            }
        }
    }
}

struct CategoryTag_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTag()
    }
}
