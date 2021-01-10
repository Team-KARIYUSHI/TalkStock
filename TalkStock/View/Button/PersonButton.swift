//
//  PersonButton.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/10.
//

import SwiftUI

struct PersonButton: View {
    
    var personName: String
    
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack(spacing: 0) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: UIComponents.screenWidth / 6, height: UIComponents.screenWidth / 6)
                
                Text(personName)
            }.foregroundColor(.black)
        }
    }
}

struct PersonButton_Previews: PreviewProvider {
    static var previews: some View {
        PersonButton(personName: "愛知 太郎", action: {})
    }
}
