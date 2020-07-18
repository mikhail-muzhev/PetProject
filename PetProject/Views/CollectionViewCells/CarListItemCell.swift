//
//  CarListItemCell.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 18.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import UIKit
import Kingfisher

protocol CarListItem: FillModel {
    var imageLink: String { get }
    var title: String { get }
}

final class CarListItemCell: UICollectionViewCell {

    private lazy var carImageView: UIImageView = {
        UIImageView()
    }()

    private lazy var titleLabel: AttributedLabel = {
        AttributedLabel(style: .blackRegularCenter15)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubviews(carImageView, titleLabel)
    }

    private func configureConstraints() {
        carImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(carImageView.snp.height)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(carImageView.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}

extension CarListItemCell: Fillable {

    func fill(model: FillModel) {
        guard let model = model as? CarListItem else {
            return
        }
        titleLabel.text = model.title
        guard let imageUrl = URL(string: model.imageLink) else { return }
        carImageView.kf.setImage(with: imageUrl)
    }

}
