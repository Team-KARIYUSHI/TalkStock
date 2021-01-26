//
//  DeleteButton.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/26.
//

import SwiftUI

struct DeleteButton: View {
    
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "trash.fill")
                .resizable()
                .frame(width: UIComponents.screenWidth / 10, height: UIComponents.screenWidth / 10)
                .foregroundColor(.black)
        }
    }
}


struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(action: {})
    }
}
