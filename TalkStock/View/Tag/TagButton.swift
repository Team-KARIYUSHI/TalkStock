//
//  TagButton.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/28.
//

import SwiftUI

struct TagButton: View {
    
    @Binding var selected: Int
    var index: Int
    var tagName: String
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            selected = index
            action()
        }) {
            Text(tagName)
                .padding()
                .foregroundColor(.black)
                .background(self.selected == index ? Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)) : Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .frame(height: UIComponents.screenWidth / 15)
                .cornerRadius(30)
                .lineLimit(1)
                .id(index)
        }
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(selected: .constant(0),
                  index: 0,
                  tagName: "タグ",
                  action: {})
    }
}
