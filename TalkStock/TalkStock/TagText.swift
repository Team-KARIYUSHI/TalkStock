//
//  TagText.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/28.
//

import SwiftUI

struct TagText: View {
    var tagName = "タグ"
    
    var body: some View {
        
        Text(tagName)
            .padding()
            .foregroundColor(.black)
            .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
            .frame(height: UIComponents.screenWidth / 15)
            .cornerRadius(30)
            .lineLimit(1)
        
    }
}

struct TagText_Previews: PreviewProvider {
    static var previews: some View {
        TagText()
    }
}
