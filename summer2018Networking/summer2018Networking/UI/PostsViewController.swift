//
//  PostsViewController.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/11/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    var postsArray = [Posts]() {
        didSet {
            postsTableView.reloadData()
            }
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let nib = UINib(nibName: "PostsTableViewCell", bundle: nil)
        postsTableView.register(nib, forCellReuseIdentifier: "PostsViewIdentyficator")
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
    
    
    
    
}
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsViewIdentyficator", for: indexPath) as!
        PostsTableViewCell
        cell.posts = postsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
}
