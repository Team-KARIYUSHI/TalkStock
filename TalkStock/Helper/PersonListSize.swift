//
//  PersonListEnum.swift
//  TalkStock
//
//  Created by 久富稜也 on 2021/01/17.
//

import Foundation
import UIKit

enum PersonListSize {
    case tabBar
    case modal
    
    var setHeight: CGFloat {
        
        switch self {
        case .modal:
            return UIComponents.screenWidth * 1.75
            
        case .tabBar:
            return UIComponents.screenHeight - 170
        }
    }
}
