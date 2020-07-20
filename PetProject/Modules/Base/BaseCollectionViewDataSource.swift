//
//  BaseCollectionViewDataSource.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 18.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

protocol FillableSection {
    var rows: [FillModel] { get }
}

class BaseCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    var sections: [FillableSection]

    init(sections: [FillableSection]) {
        self.sections = sections
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = sections[indexPath.section].rows[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIdentifier, for: indexPath)
        if let cell = cell as? Fillable {
            cell.fill(model: model)
        }
        return cell
    }
    
}
