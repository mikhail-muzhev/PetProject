//
//  MainView.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit
import SnapKit

protocol MainViewProtocol: class {

}

final class MainView: UIView {
    
    private let presenter: MainPresenterProtocol
    
    // MARK: - UI Elements
    
    // MARK: - Lifecycle
    
    init(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Layout

extension MainView {
    
    private func setupSubviews() {
        addSubviews()
        configureConstraints()
    }
    
    private func configureConstraints() {
        
    }

    private func addSubviews() {
        
    }

}

// MARK: - MainViewProtocol

extension MainView: MainViewProtocol {

}
