//
//  LoadingView.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/03.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    
    @Binding var title: String
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        ZStack {
            content()
                .blur(radius: isShowing ? 3 : 0)
                .animation(.easeIn)
            
            ZStack {
                VStack {
                    Text(title)
                        .multilineTextAlignment(.center)
                    ActivityIndicator(animating: $isShowing)
                }.frame(width: 200,height: 160)
                .compositingGroup()
                .background(RoundedRectangle(cornerRadius: 5)
                    .fill(Color(UIColor.systemBackground)))
                    .shadow(radius: 6)
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity)
                .animation(.none)
                .background(Color.gray.opacity(0.5))
                .opacity(self.isShowing ? 1 : 0)
                .animation(.easeIn)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: .constant("読込中..."),
                    isShowing: .constant(true)){
                        VStack{
                            Text("読込中...")
                        }
                    }
    }
}
