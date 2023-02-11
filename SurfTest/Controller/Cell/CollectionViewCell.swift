//
//  CollectionViewCell.swift
//  SurfTest
//
//  Created by Sergey on 07.02.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var tapped = false

    let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func setupTitles(model: CellModel) {
        button.setTitle(model.title, for: .normal)
        tapped = model.tapped

        if tapped {
            button.backgroundColor = #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1)
            button.setTitleColor(.white, for: .normal)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
            button.setTitleColor(.black, for: .normal)
        }
    }
}
