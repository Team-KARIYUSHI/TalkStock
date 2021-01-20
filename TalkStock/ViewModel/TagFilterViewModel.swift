//
//  TagButtonScrollBarViewModel.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/18.
//

import Foundation
import SwiftUI

final class TagFilterViewModel: ObservableObject {
    var topicData: [MemoTitle]? = memoTitles // TODO:DBから値を取得してくる処理に変更する
}
