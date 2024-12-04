//
//  ShoppingCart.swift
//  Doggy Depot
//
//

import ParseSwift
import Foundation

struct ShoppingCart: ParseObject {

    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?


    var user: Pointer<User>? // Pointer to the logged-in user
    var items: [Pointer<Item>]? // Array of pointers to items in the cart


    init() {}
}

