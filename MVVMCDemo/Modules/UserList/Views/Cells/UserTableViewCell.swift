//
//  UserTableViewCell.swift
//  MVVMCDemo
//
//  Created by Skyzizhu on 2025/1/6.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let genderLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, genderLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        contentView.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with user: User) {
        nameLabel.text = "Name: \(user.name)"
        ageLabel.text = "Age: \(user.age)"
        genderLabel.text = "Gender: \(user.gender)"
    }
}

