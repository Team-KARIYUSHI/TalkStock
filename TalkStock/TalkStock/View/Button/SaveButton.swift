//
//  SaveButton.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/07.
//

import SwiftUI

/*
 * 登録ボタン。新規作成画面用
 */

struct SaveButton: View {
    
    // これで登録と更新のボタン名を切り替える
    var title: String
    
    // 親Viewで行いたい処理（登録処理）を書く
    var action: ()->Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .frame(width: UIComponents.screenWidth - 50, height: UIComponents.screenWidth / 9)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
        }.cornerRadius(10)
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(title: "登録", action: {})
    }
}
