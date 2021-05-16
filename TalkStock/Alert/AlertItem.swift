//
//  AlertItem.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var alert: Alert
}

enum AlertItemType {
    case confirmDelete
    case completeDelete
    case failedDelete
    
    func switchDeleteAlert(completion: @escaping()->Void) -> AlertItem {
        switch self {
        case .confirmDelete:
            return AlertItem(alert: Alert(title: Text("削除確認"),
                                          message: Text("削除してもよろしいですか？"),
                                          primaryButton: .default(Text("OK")){completion()},
                                          secondaryButton: .cancel()))
        case .completeDelete:
            return AlertItem(alert: Alert(title: Text("削除完了"),
                                          message: Text("削除しました"),
                                          dismissButton: .default(Text("OK")){completion()}))
        case .failedDelete:
            return AlertItem(alert: Alert(title: Text("削除失敗"),
                                          message: Text("削除に失敗しました"),
                                          dismissButton: .default(Text("OK"))))
        }
    }
}
