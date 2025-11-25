//
//  ViewController.swift
//  LocalJSON
//
//  Created by Dhathri Bathini on 11/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = {
        let tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        return tableView
    }()
    
    var userViewModel: UserViewModel?
    
    init(userViewModel: UserViewModel = UserViewModel(shared: FileManager.shared)) {
        self.userViewModel = userViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupUI()
        userViewModel?.getData()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userViewModel?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        if let userViewModel = userViewModel {
            cell.label1.text = userViewModel.getUser(index: indexPath.row).name
            cell.label2.text = userViewModel.getUser(index: indexPath.row).email
        }
        return cell
    }
}

extension ViewController {
    func setupDelegates(){
        tableView.dataSource = self
    }
    
    func setupUI(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

