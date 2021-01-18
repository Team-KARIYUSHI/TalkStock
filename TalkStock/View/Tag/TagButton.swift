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
    var color: Color
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            selected = index
            action()
        }) {
            Text(tagName)
                .padding()
                .foregroundColor(.black)
                .background(self.selected == index ? color : Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
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
                  color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
                  action: {})
    }
}
