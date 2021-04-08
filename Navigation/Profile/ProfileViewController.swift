//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let reuseId = "cellId"
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(0)),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: CGFloat(0)),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: CGFloat(0)),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(0))
        ])
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.register(ProfileHeaderViewNew.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderViewNew.self))
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.arrayOfPosts.count
    }
    
    //ПРОБЛЕМА С ПЕРЕИСПОЛЬЗОВАНИЕМ ЯЧЕЕК!!!!! - решена🦆
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PostTableViewCell
        // let cell = PostTableViewCell()
        cell.post = Storage.arrayOfPosts[indexPath.row]
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView: ProfileHeaderViewNew = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderViewNew.self)) as? ProfileHeaderViewNew else { return nil }
        print("пока рабоатет,перекрестились")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220.0
    }
}

