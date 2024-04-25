//
//  UserSetting.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import Foundation

final class UserSettings {
    @UserDefault("login")
    var login: String = "Admin"
 
}

