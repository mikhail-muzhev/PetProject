//
//  CarsListPresenter.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

protocol CarsListPresenterProtocol {
    func setView(_ view: CarsListViewProtocol)
}

final class CarsListPresenter {

    weak var router: CarsListRouter?
    private weak var view: CarsListViewProtocol?
    private let interactor: CarsListInteractor
    
    init(_ router: CarsListRouter?, _ interactor: CarsListInteractor) {
        self.router = router
        self.interactor = interactor
    }

}

// MARK: - CarsListPresenterProtocol

extension CarsListPresenter: CarsListPresenterProtocol {

    func setView(_ view: CarsListViewProtocol) {
        self.view = view
    }

}
