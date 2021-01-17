//
//  MultilineTextField.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/03.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.font = UIFont.systemFont(ofSize: 18)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
    }
    
}
