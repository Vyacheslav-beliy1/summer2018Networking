//
//  RequestManager.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/3/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class RequestManager {
    class func getPosts(with id: Int? = nil) {
       let path = "http://jsonplaceholder.typicode.com/posts"
        if let url = URL(string: path) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let unwrapError = error {
                    print("Error -\(unwrapError.localizedDescription)")
                    } else if let getData = data,
                let getResponse = response as? HTTPURLResponse,
                    getResponse.statusCode == 200 {
                        print("DATA: \(getData)")
                }
            }
            dataTask.resume()
        }
    }
    
}
