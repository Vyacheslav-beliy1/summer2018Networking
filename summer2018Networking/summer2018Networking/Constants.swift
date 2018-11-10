

import Foundation

struct Constants {
   private init () {}
    
    struct Networking {
        private init () {}
        static let baseServerURL = "http://jsonplaceholder.typicode.com"
        static let postsURL = baseServerURL + "/posts"
        static let users = baseServerURL + "/users"
        static let comments = baseServerURL + "/comments"
    }
}
