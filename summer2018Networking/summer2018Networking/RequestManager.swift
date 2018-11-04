//
//  RequestManager.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/3/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class RequestManager {
    class func getPosts(with userId: Int = 1, completionHandler: @escaping ([Posts]) -> Void) {
       let path = "http://jsonplaceholder.typicode.com/posts"
    
        
        
        guard let url = URL(string: path) else { return print("error dont unwrap URL")}
        var components =  URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "userId", value: String(userId))]
        
        guard let urlWithQuery = components?.url else { return }
        
        
        let dataTask = URLSession.shared.dataTask(with: urlWithQuery) { (data, response, error) in
            if let unwrapError = error {
                print("Error -\(unwrapError.localizedDescription)")
            } else if let jsonData = data,
                let getResponse = response as? HTTPURLResponse,
                getResponse.statusCode == 200 {
                do {
                    let posts = try   JSONDecoder().decode([Posts].self, from: jsonData)
                    //if measteke go to catch
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
        guard let url = URL(string: path) else { return print("error dont unwrap URL")}
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let unwrapError = error {
                print("Error -\(unwrapError.localizedDescription)")
            } else if let jsonData = data,
                let getResponse = response as? HTTPURLResponse,
                getResponse.statusCode == 200 {
                do {
                    let users = try   JSONDecoder().decode([User].self, from: jsonData)
                    //if measteke go to catch
                    completionHandler(users)
                    
                } catch {
                    print("\(error.localizedDescription)")
                }
                
            }
        }
        dataTask.resume()
        }
  
    class func createPost(_ post: Posts) {
        guard let url = URL(string: Constants.Networking.postsURL) else { return }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let data = try? JSONEncoder().encode(post) else { return }
        let task = URLSession.shared.uploadTask(with: request as URLRequest, from: data)
        task.resume()
        
    }
    
    
    
}


