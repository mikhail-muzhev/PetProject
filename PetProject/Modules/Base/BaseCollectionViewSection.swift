//
//  BaseCollectionViewSection.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 18.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import Foundation

class BaseCollectionViewSection: FillableSection {

    var rows: [FillModel]

    init(rows: [FillModel]) {
        self.rows = rows
    }
}
