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
    
    var isDisabled: Bool = false
    
    var forgrougndColor: Color {
        return isDisabled ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)) : Color.white
    }
    
    var backgroundColor: Color {
        return isDisabled ? Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) : Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .frame(width: UIComponents.screenWidth - 50, height: UIComponents.screenWidth / 9)
                .foregroundColor(forgrougndColor)
                .background(backgroundColor)
        }
        .disabled(isDisabled)
        .animation(.easeOut)
        .cornerRadius(10)
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(title: "登録", action: {})
    }
}
