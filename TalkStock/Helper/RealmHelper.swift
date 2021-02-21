//
//  RealmHelper.swift
//  TalkStock
//
//  Created by kazuya on 2021/02/21.
//

import Foundation
import UIKit
import RealmSwift

class RealmHelper {
    
    
    /// 選択した画像をリサイズするメソッド
    /// - Parameters:
    ///   - originalImg: リサイズする前の画像
    ///   - width: リサイズ後の幅（推奨200px）
    /// - Returns: pngDataに変換してData型で返却
    static func resizeImage(originalImg: UIImage, width: Double) -> Data {
        var imageData = originalImg.pngData()
        if (imageData!.count) > 1000000 {
            
            let aspectScale = originalImg.size.height / originalImg.size.width
            let resizedSize = CGSize(width: width, height: width * Double(aspectScale))
            UIGraphicsBeginImageContext(resizedSize)
            originalImg.draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
            let resizedImg = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            imageData = resizedImg?.pngData()
        }
        
        return (imageData as Data?) ?? Data()
    }
}
