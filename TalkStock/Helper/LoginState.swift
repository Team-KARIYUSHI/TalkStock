//
//  LoginState.swift
//  TalkStock
//
//  Created by kazuya on 2021/05/17.
//

import Foundation
import SwiftUI

class LoginState: ObservableObject {
    // アプリ起動時のロック解除フラグ
    @Published var isUnlocked: Bool = false
}
