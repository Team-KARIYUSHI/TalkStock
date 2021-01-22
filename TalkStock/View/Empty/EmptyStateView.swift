//
//  EmptyStateView.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/22.
//

import SwiftUI

struct EmptyStateView: View {
    
    var imageName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: UIComponents.screenWidth / 2,
                       height: UIComponents.screenWidth / 2)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .center)
        .background(Color(#colorLiteral(red: 0.3315601647, green: 0.7528054118, blue: 0.9943392873, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: EmptyState.authError.setImageName)
    }
}
