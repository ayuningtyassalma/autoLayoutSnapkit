//
//  ViewController.swift
//  autoLayoutSnapkit
//
//  Created by Salma Ayuningtyas on 23/05/23.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    private lazy var tableView: UITableView = {
        let tbVw  = UITableView()
        tbVw.backgroundColor = .clear
        tbVw.separatorStyle = .none
        tbVw.register(RoleUserTableViewCell.self, forCellReuseIdentifier: "RoleUserTableViewCell")
        tbVw.register(HeaderTableViewCell.self, forCellReuseIdentifier: "HeaderTableViewCell")
        tbVw.register(ButtonTableViewCell.self, forCellReuseIdentifier: "ButtonTableViewCell")
        return tbVw
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableVw()
        cardView()
    }
    
    func setUpTableVw(){
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
        tableView.contentInset = .init(top: 80, left: 0, bottom: 0, right: 0 )
        
    }
    
    func cardView() -> [UserRole]{
        let corporateUser = UserRole(title: "Corporate User", subtitle: "I want to link insurance and corporate company to get benefits.", img: "image", userRole: .corporate)
        let normalUser = UserRole(title: "Normal User", subtitle: "I want to register first.", img: "image", userRole: .normal)
        let guestUser = UserRole(title: "Guest User", subtitle: "I want to see what the app has to offer.", img: "image", userRole: .guest)
        return [corporateUser, normalUser, guestUser]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0,2:
            return 1
        case 1:
            return cardView().count
        default:
            break
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()}
            cell.setUp()
        return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RoleUserTableViewCell.identifier, for: indexPath) as? RoleUserTableViewCell else {
                return UITableViewCell()}
        cell.setUpBox()
        let modelData = cardView()[indexPath.row]
        cell.configureCell(roleUser: cardView())
        return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as? ButtonTableViewCell else { return UITableViewCell() }
            cell.setUpCell()
    
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0,1:
            return UITableView.automaticDimension
        case 2:
            return 300
        default:
            break
        }
        
        return 300
    }
    

}

