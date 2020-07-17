//
//  CarsListRouter.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

final class CarsListRouter: BaseRouter {

    override func start() {
        let viewController = CarsListFabric.assembledScreen(router: self)
        navigationController?.present(viewController, animated: true)
    }
    
}

// MARK: - Routing Methods

extension CarsListRouter {
    
}
