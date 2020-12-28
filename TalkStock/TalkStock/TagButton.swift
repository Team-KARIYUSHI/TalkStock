//
//  TagButton.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/28.
//

import SwiftUI

struct TagButton: View {
    
    var body: some View {
        
        Button(action: {
            
        }) {
            Text("")
                .padding()
                .foregroundColor(.black)
                .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                .frame(height: UIComponents.screenWidth / 15)
                .cornerRadius(30)
                .lineLimit(1)
        }
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton()
    }
}
