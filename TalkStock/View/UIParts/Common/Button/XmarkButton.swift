//
//  XmarkButton.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/13.
//

import SwiftUI

struct XmarkButton: View {
    
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            
            Image(systemName: "xmark")
                .resizable()
                .frame(width:  UIComponents.screenWidth / 20,
                       height:  UIComponents.screenWidth / 20)
                .foregroundColor(.black)
        }
    }
}

struct XmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XmarkButton(action: {})
    }
}
