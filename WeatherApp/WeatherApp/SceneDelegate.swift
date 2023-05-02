//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Prasanth on 03/05/23.
//

import UIKit
import Weather

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let url = URL(string: "http://api.openweathermap.org")!
        let appId = "c6bf0a6390339725a3d6ff65a3fd1059"
        let session = URLSession(configuration: .ephemeral)
        let client = URLSessionHTTPClient(session: session)
        let cityFinder = RemoteCityFinder(baseURL: url, appId: appId, httpClient: client)
        let weatherViewController = WeatherUIComposer.composedWith(cityFinder: cityFinder)

        window = UIWindow(windowScene: scene)
        window?.rootViewController = UINavigationController(rootViewController: weatherViewController)
        window?.makeKeyAndVisible()
    }

}

