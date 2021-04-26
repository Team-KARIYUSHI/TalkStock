//
//  MultilineTextField.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/03.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String
    
    // Viewの作成メソッド
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }
    // Viewの更新メソッド
    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }
    
    // インスタンスを作成
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: MultilineTextField
        
        init(_ textView: MultilineTextField) {
            self.parent = textView
        }
        
        // Viewの編集許可
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        // View更新の通知
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
