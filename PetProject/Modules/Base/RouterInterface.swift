//
//  RouterInterface.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

protocol RouterInterface: class {
    var navigationController: UINavigationController? { get }
    var childRouters: [RouterInterface?] { get set }
    func start()
    init(navigation: UINavigationController?)
}
