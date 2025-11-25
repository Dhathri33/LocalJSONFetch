//
//  UserTableViewCell.swift
//  LocalJSON
//
//  Created by Dhathri Bathini on 11/25/25.
//
import UIKit

class UserTableViewCell: UITableViewCell {
    static let reuseIdentifier = "UserTableViewCell"
    let label1 = {
        let label1 = UILabel()
        label1.font = .systemFont(ofSize: 20, weight: .bold)
        label1.textColor = .black
        label1.numberOfLines = 1
        label1.translatesAutoresizingMaskIntoConstraints = false
        return label1
    }()
    
    let label2 = {
        let label2 = UILabel()
        label2.font = .systemFont(ofSize: 18, weight: .medium)
        label2.textColor = .black
        label2.numberOfLines = 1
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserTableViewCell {
    func setupUI() {
        let VStack = UIStackView(arrangedSubviews: [label1, label2])
        VStack.axis = .vertical
        VStack.spacing = 10
        VStack.alignment = .center
        VStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(VStack)
        NSLayoutConstraint.activate([
            VStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            VStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            VStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            VStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
}
