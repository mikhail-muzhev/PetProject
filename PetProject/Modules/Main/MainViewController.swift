//
//  MainViewController.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    private let _view: MainView

    // MARK: - Lifecycle

    init(_ presenter: MainPresenterProtocol) {
        _view = MainView(presenter)
        presenter.setView(_view)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
        title = R.string.localizable.main_title()
        view.backgroundColor = .white
    }
    
}
