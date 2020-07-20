//
//  CarsListView.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit
import SnapKit

protocol CarsListViewProtocol: class {
    func set(_ cars: [CarListItem])
}

final class CarsListView: UIView {
    
    private let presenter: CarsListPresenterProtocol
    private var dataSource = CarsListDataSource(carsItems: [])
    
    // MARK: - UI Elements

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    init(_ presenter: CarsListPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Layout

extension CarsListView {
    
    private func setupSubviews() {
        addSubviews()
        configureConstraints()
    }
    
    private func configureConstraints() {
        
    }

    private func addSubviews() {
        
    }
    
}

// MARK: - CarsListViewProtocol

extension CarsListView: CarsListViewProtocol {

    func set(_ cars: [CarListItem]) {
        self.dataSource = CarsListDataSource(carsItems: cars)
        collectionView.dataSource = self.dataSource
        collectionView.reloadData()
    }

}
