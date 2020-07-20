//
//  CarsListDataSource.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 18.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

final class CarsListDataSource: BaseCollectionViewDataSource {

    var carsItems: [CarListItem]

    init(carsItems: [CarListItem]) {
        self.carsItems = carsItems
        super.init(sections: [])

        self.sections = [carsSection(carsItems: carsItems)]
    }

    private func carsSection(carsItems: [CarListItem]) -> FillableSection {
        BaseCollectionViewSection(rows: carsItems)
    }
    
}
