//
//  UserRole.swift
//  autoLayoutSnapkit
//
//  Created by Salma Ayuningtyas on 23/05/23.
//

import Foundation

struct UserRole{
    var title : String?
    var subtitle : String?
    var img : String?
    var userRole : Role?
}

enum Role{
    case corporate
    case normal
    case guest
}
