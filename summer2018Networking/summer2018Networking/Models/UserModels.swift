//
//  UserModels.swift
//  summer2018Networking
//
//  Created by Vitaly Dergunov on 11/4/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class User: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: UserAdress?
    var phone: String?
    var website: String?
    var company: UserCompany?
    
}

class UserAdress: Codable {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: UserGeo?
}

class UserGeo: Codable {
    var lat: String?
    var lng: String?
    }

class UserCompany: Codable {
    var name: String?
    var caychPhrase: String?
    var bs: String?
}

