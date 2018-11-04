//
//  Constants.swift
//  summer2018Networking
//
//  Created by bws2007 on 11/4/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

struct Constants {
    private init () {}
    
    struct Networking {
        private init () {}
        
        static let baseServerURL = "http://jsonplaceholder.typicode.com"
        static let postsURL = baseServerURL + "/posts"
        static let users = baseServerURL + "/users"
    }
    
    struct UI {
        private init () {}
        
        static let rightOffsetCell: CGFloat = 10.0
    }
}
