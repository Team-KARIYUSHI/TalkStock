//
//  PlusCircleButton.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/07.
//

import SwiftUI


/**
 * ◯➕のモーダル表示ボタン。新規登録画面用
 */
struct PlusCircleButton<V: View>: View {
    
    // 親ViewからもらったBooleanの値でモーダルオープン
    @Binding var isPresented: Bool
    
    // ジェネリクスなのでViewならなんでもOK
    var view: V
    
    var body: some View {
        Button(action: {
            self.isPresented = true
        }) {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: UIComponents.screenWidth / 10, height: UIComponents.screenWidth / 10)
                .foregroundColor(.black)
        }.sheet(isPresented: self.$isPresented) {
            self.view
        }.padding(.bottom, 10)
    }
}

struct PlusCircleButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusCircleButton(isPresented: .constant(false),
                         view: EmptyView())
    }
}
