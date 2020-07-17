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

}

final class CarsListView: UIView {
    
    private let presenter: CarsListPresenterProtocol
    
    // MARK: - UI Elements
    
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

}
