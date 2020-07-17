//
//  BaseRouter.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

class BaseRouter: NSObject, RouterInterface {
        
    // MARK: - Coordinate variables
    
    weak var parentCoordinator: BaseRouter?
    var childRouters = [RouterInterface?]()
    
    // MARK: - Navigation variables
    
    var window: UIWindow? {
        didSet {
            guard let navigationController = window?.rootViewController as? UINavigationController else { return }
            prepareNavigationController(navigationController)
        }
    }
    
    var navigationController: UINavigationController? {
        didSet {
            guard let navigationController = navigationController else { return }
            prepareNavigationController(navigationController)
        }
    }
    
    // MARK: - Init
    
    convenience init(window: UIWindow?) {
        self.init(navigation: nil)
        self.window = window
    }
    
    required init(navigation: UINavigationController?) {
        self.navigationController = navigation
        super.init()
        guard let navigationController = navigation else { return }
        prepareNavigationController(navigationController)
    }
    
    // MARK: - Public
    
    func start() {}
    
    func onNext(childCoordinator: BaseRouter) {
        childRouters.append(childCoordinator)
        childCoordinator.start()
    }
    
    func deinitialize() {
        guard let parentCoordinator = parentCoordinator else { return }
        parentCoordinator.childRouters.removeAll(where: { $0 === self })
    }
    
    func allChildren() -> [BaseRouter] {
        guard let childCoordinators = childRouters as? [BaseRouter] else { return [] }
        return childCoordinators
    }
    
    private func prepareNavigationController(_ navigationController: UINavigationController) {
        navigationController.delegate = MainRouter.get()
    }
    
}

private let kEmptyString = ""

extension MainRouter: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: kEmptyString,
                                                                          style: .plain,
                                                                          target: nil,
                                                                          action: nil)
        guard let viewController = viewController as? NavigationBarOwnerInterface else { return }
        viewController.willShowNavigationBar(navigationController.navigationBar)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let viewController = viewController as? NavigationBarOwnerInterface else { return }
        viewController.didShowNavigationBar(navigationController.navigationBar)
    }
    
}
