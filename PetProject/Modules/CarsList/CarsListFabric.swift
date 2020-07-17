//
//  CarsListFabric.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

final class CarsListFabric {

    class func assembledScreen(router: CarsListRouter) ->
        CarsListViewController {
            let interactor = CarsListInteractor()
            let presenter = CarsListPresenter(router, interactor)
            let viewController = CarsListViewController(presenter)
            
            return viewController
    }
    
}
