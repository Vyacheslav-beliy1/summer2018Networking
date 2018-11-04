//
//  UserModels.swift
//  summer2018Networking
//
//  Created by bws2007 on 11/4/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class User: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: UserAddress?
    var phone: String?
    var website: String?
    var company: UserCompany?
}

class UserAddress: Codable {
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
    var catchPhrase: String?
    var bs: String?
}









