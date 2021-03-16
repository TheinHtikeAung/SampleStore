//
//  SceneDelegate.swift
//  SampleStore
//
//  Created by Thein Htike Aung on 15/3/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        guard let userActivity = connectionOptions.userActivities.first,
              let urlToOpen = userActivity.webpageURL,
              userActivity.activityType == NSUserActivityTypeBrowsingWeb else {

            goToStoreListingVC()

            return
        }

        handleURL(urlToOpen)
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard let urlToOpen = userActivity.webpageURL,
              userActivity.activityType == NSUserActivityTypeBrowsingWeb
        else {
            return
        }
        handleURL(urlToOpen)
    }

    func handleURL(_ url: URL) {

        guard url.host == "testingapplinks.herokuapp.com",
              url.pathComponents[1] == "checkin",
              let params = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems,
              let storeId = params.first(where: { $0.name == "storeId" })?.value
        else {
            goToStoreListingVC()
            return
        }

        let navController = UINavigationController()
        navController.viewControllers = [StoreListingVC(), StoreDetailVC(storeId: storeId)]
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

    func goToStoreListingVC() {
        let navController = UINavigationController(rootViewController: StoreListingVC())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

