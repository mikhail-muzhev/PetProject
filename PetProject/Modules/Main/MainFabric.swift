//
//  MainFabric.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

final class MainFabric {

    class func assembledScreen(router: MainRouter) ->
        MainViewController {
            let interactor = MainInteractor()
            let presenter = MainPresenter(router, interactor)
            let viewController = MainViewController(presenter)
            
            return viewController
    }
    
}
