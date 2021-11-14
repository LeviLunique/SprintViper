//
//  SceneDelegate.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: winScene)
        guard let window = self.window else {  return }
        
        SprintListRouter().present(in: window)
        
    }
}
