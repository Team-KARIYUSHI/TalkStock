//
//  SceneDelegate.swift
//  TalkStock
//
//  Created by 久富稜也 on 2020/12/24.
//

import UIKit
import SwiftUI
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let login = NSNotification.Name("login")
    let home = NSNotification.Name("home")

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: SplashView())
            
            // NotificationのObserver側
            // SplashViewから通知がきたらRootViewを入れ替える
            // 共有するインスタンス紐付け
            replaceRootView(TabBarView().environmentObject(LoginState()), home)
            
            self.window = window
            window.makeKeyAndVisible()
        }
        
        // 関係タグ管理テーブルにデータがなかったらデフォルトデータを作る
        if RelationshipManagement.count(object: RelationshipManagement.all) == 0 {
            Relationship.makeSelf(relationships)
        } // 関係タグテーブルがなかったらデフォルトデータを作る
        else if Relationship.count(Relationship.all) == 0 {
            Relationship.addOriginal(RelationshipManagement.all)
        }
        
        // 会話ネタタグ管理テーブルにデータがなかったらデフォルトデータを作る
        if TopicTagManagement.count(object: TopicTagManagement.all) == 0 {
            TopicTag.makeSelf(topicTags)
        } // 会話ネタタグテーブルがなかったらデフォルトデータを作る
        else if TopicTag.count(TopicTag.all) == 0 {
            TopicTag.addOriginal(TopicTagManagement.all)
        }
        
//        let talkpartnerResults = try! Realm().objects(Talkpartners.self)
//
//        if talkpartnerResults.count == 0 {
//            let realm = try! Realm()
//            do {
//                try realm.write {
//                    for talkpartnerTopic in talkpartnerTopics {
//                        realm.add(TalkpartnerTopic(value: talkpartnerTopic))
//                    }
//                }
//            } catch {
//                print(error)
//            }
//        } else {
//
//        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
    /// ルートビューをオブザーバパターンで入替えるためのメソッド
    /// - Parameters:
    ///   - changeRootView: 入替えるビュー
    ///   - notificationName: 通知名
    private func replaceRootView<V: View>(_ changeRootView: V, _ notificationName: Notification.Name) {
        NotificationCenter.default.addObserver(forName: notificationName,
                                               object: nil,
                                               queue: nil,
                                               using: {_ in
                                                
                                                self.window!.rootViewController = UIHostingController(rootView: changeRootView)
                                               })
    }


}

