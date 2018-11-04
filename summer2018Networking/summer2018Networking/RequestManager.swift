//
//  RequestManager.swift
//  summer2018Networking
//
//  Created by bws2007 on 11/3/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class RequestManager {
    
    class func getPosts(with userId: Int = 1, completionHandler: @escaping ([Post]) -> Void) {
        let path = "http://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: path) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "userId", value: String(userId))]
        
        guard let urlWithQuery = components?.url else { return }
        
        let dataTask = URLSession.shared.dataTask(with: urlWithQuery) { (data, response, error) in
            
            if let unwrapError = error {
                print("Erorr - \(unwrapError.localizedDescription)")
            } else if let jsonData = data,
                let getResponse = response as? HTTPURLResponse,
                getResponse.statusCode == 200 {
                
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: jsonData)
                    completionHandler(posts)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
    
    class func users(completionHandler: @escaping ([User]) -> Void) {
        let path = "http://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: path) else { return }

        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let unwrapError = error {
                print("Erorr - \(unwrapError.localizedDescription)")
            } else if let jsonData = data,
                let getResponse = response as? HTTPURLResponse,
                getResponse.statusCode == 200 {
                
                do {
                    let users = try JSONDecoder().decode([User].self, from: jsonData)
                    completionHandler(users)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
    
    class func createPost(_ post: Post) {
        
        guard let url = URL(string: Constants.Networking.postsURL ) else { return }
        
        guard let data = try? JSONEncoder().encode(post) else { return }
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.uploadTask(with: request as URLRequest, from: data)
        
//        request.httpBody = data
//        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
//            //eror ? if response code
//        }
        
        task.resume()
        
    }
}











