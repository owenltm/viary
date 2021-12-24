//
//  User.swift
//  viary
//
//  Created by user on 24/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import Foundation

class User {
    var idUser: Double
    var username: String
    var password: String
    
    init(idUser: Double, username: String, password: String) {
        self.idUser = idUser
        self.username = username
        self.password = password
    }
}
