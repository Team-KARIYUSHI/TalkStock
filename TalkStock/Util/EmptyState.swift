//
//  EmptyState.swift
//  TalkStock
//
//  Created by kazuya on 2021/01/22.
//

import Foundation

enum EmptyState {
    case noPerson
    case noTopic
    case authError
    case splash
    
    var setImageName: String {
        switch self {
        case .noPerson:
            return "no_person_data"
        case .noTopic:
            return "no_topic_data"
        case .authError:
            return "auth_error"
        case .splash:
            return "app_logo"
        }
    }
}
