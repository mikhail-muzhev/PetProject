//
//  NavigationBarOwner.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 17.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

protocol NavigationBarOwnerInterface {
    func willShowNavigationBar(_ navigationBar: UINavigationBar)
    func didShowNavigationBar(_ navigationBar: UINavigationBar)
}
