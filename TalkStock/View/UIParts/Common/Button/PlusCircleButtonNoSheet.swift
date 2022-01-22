//
//  PlusCircleButtonNoSheet.swift
//  TalkStock
//
//  Created by kazuya on 2021/05/31.
//

import SwiftUI

struct PlusCircleButtonNoSheet: View {
    
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: UIComponents.screenWidth / 10, height: UIComponents.screenWidth / 10)
                .foregroundColor(.black)
        }.padding(.bottom, 10)
    }
}

struct PlusCircleButtonNoSheet_Previews: PreviewProvider {
    static var previews: some View {
        PlusCircleButtonNoSheet(action: {})
    }
}
