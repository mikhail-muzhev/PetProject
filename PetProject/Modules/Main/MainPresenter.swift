//
//  MainPresenter.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

protocol MainPresenterProtocol {
    func setView(_ view: MainViewProtocol)
}

final class MainPresenter {

    weak var router: MainRouter?
    private weak var view: MainViewProtocol?
    private let interactor: MainInteractor
    
    init(_ router: MainRouter?, _ interactor: MainInteractor) {
        self.router = router
        self.interactor = interactor
    }

}

// MARK: - MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {

    func setView(_ view: MainViewProtocol) {
        self.view = view
    }

}
