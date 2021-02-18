//
//  PlusButton.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/07.
//

import SwiftUI

/*
 * ➕のモーダル表示ボタン。ナビゲーションバー用
 */
struct PlusButton<V: View>: View {
    
    // 親ViewからもらうBooleanの値でモーダルオープン
    @Binding var isPresented: Bool
    
    // ジェネリクスなのでViewならなんでもOK
    var view: V
    
    var body: some View {
        Button(action: {
            self.isPresented.toggle()
        }) {
            Image(systemName: "plus")
                .resizable()
                .frame(width:  UIComponents.screenWidth / 20,
                       height:  UIComponents.screenWidth / 20)
        }.sheet(isPresented: self.$isPresented) {
            self.view
        }
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(isPresented: .constant(false),
                   view: EmptyView())
    }
}
