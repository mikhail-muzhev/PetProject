//
//  MainRouter.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

final class MainRouter: BaseRouter {

    class func get() -> MainRouter? {
        guard Thread.isMainThread else { return nil }
        
        guard let appDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return nil }
        return appDelegate.mainRouter
    }

    override func start() {
        navigationController = UINavigationController(nibName: nil, bundle: nil)
        let viewController = MainFabric.assembledScreen(router: self)
        window?.rootViewController = navigationController
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
}

// MARK: - Routing Methods

extension MainRouter {

    func navigateToCarsList() {
        let carsListRouter = CarsListRouter(navigation: navigationController)
        onNext(childCoordinator: carsListRouter)
    }

}
