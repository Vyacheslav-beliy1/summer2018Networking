//
//  ViewController.swift
//  summer2018Networking
//
//  Created by bws2007 on 11/3/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sendGetRequest() {
        RequestManager.getPosts(with: 1) { posts in
            print(posts)
            DispatchQueue.main.async {
                //label update
                //table update
            }
        }
    }
    @IBAction func getUsersAction() {
        RequestManager.users { (users) in
            print(users)
            DispatchQueue.main.async {
                //label update
                //table update
            }
        }
    }
    @IBAction func createPostAction() {
        let post = Post()
        post.id = 321
        post.userId = 1
        post.body = "body string"
        post.title = "title string"
        
        RequestManager.createPost(post)
    }
}

