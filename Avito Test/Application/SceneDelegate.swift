//
//  SceneDelegate.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let factory = ModuleFactory()
        let (view, _) = factory.makeAdBoosterModule()
            
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.rootViewController = UINavigationController(rootViewController: view)
            window.makeKeyAndVisible()
        }
    }
}

