//
//  UIComponents.swift
//  TalkStock
//
//  Created by kazuya on 2020/12/25.
//

import Foundation
import UIKit

struct UIComponents {
    
    // デバイス幅
    static let screenWidth = UIScreen.main.bounds.width
    
    // デバイスの高さ
    static let screenHeight = UIScreen.main.bounds.height
    
    //ナビゲーションバー色指定
    static func setupNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGray6
        UINavigationBar.appearance().barTintColor = .systemTeal
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
