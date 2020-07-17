//
//  CarsListViewController.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

final class CarsListViewController: UIViewController {

    private let _view: CarsListView

    // MARK: - Lifecycle

    init(_ presenter: CarsListPresenterProtocol) {
        _view = CarsListView(presenter)
        presenter.setView(_view)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
        view.backgroundColor = .white
    }
    
}
