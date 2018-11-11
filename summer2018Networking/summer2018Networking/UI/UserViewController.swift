//
//  UserViewController.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/10/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit


class UserViewController: UIViewController {
    
    @IBOutlet weak var userTabelView: UITableView!
    var usersArray = [User](){
    didSet {
    userTabelView.reloadData()
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        RequestManager.users { (users) in
            print(users)
            DispatchQueue.main.async {
                self.usersArray = users
            }
        }
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        userTabelView.register(nib, forCellReuseIdentifier: "UserTabelViewInditifier")
        
        userTabelView.delegate = self
        userTabelView.dataSource = self
    }
    
   
    
}
extension UserViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTabelViewInditifier", for: indexPath) as! UserTableViewCell
        cell.users = usersArray[indexPath.row]
        return cell
    }

}
