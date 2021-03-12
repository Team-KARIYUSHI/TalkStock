//
//  StockListSize.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/18.
//

import Foundation
import UIKit

enum TopicListSize {
    case tabBar
    case modal
    
    var setHeight: CGFloat {
        
        switch self {
        case .modal:
            return UIComponents.screenHeight - 50
            
        case .tabBar:
            return UIComponents.screenHeight - 170
        }
    }
}
