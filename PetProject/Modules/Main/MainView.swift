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

    private lazy var toCarsListButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizable.main_to_cars_list(), for: .normal)
        button.addTarget(self, action: #selector(toCarsListButtonDidPressed), for: .touchUpInside)
        button.setTitleColor(.darkText, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func toCarsListButtonDidPressed() {
        presenter.toCarsList()
    }
    
}

// MARK: - Layout

extension MainView {
    
    private func setupSubviews() {
        addSubviews()
        configureConstraints()
    }
    
    private func configureConstraints() {
        toCarsListButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    private func addSubviews() {
        addSubview(toCarsListButton)
    }

}

// MARK: - MainViewProtocol

extension MainView: MainViewProtocol {

}
