//
//  RequestManager.swift
//  summer2018Networking
//
//  Created by bws2007 on 11/3/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class RequestManager {
    
    class func getPosts(with userId: Int = 1) {
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
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
        
    }
}
