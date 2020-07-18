//
//  UIView+Subviews.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 18.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }

}
