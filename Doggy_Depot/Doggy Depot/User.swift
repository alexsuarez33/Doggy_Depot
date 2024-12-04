//
//  SwiftUIView.swift
//  Doggy Depot
//
//  Created by Anabella Amanau on 11/5/24.
//

import ParseSwift
import Foundation

struct User: ParseUser {
    var emailVerified: Bool?
    
    var authData: [String : [String : String]?]?
    
    // Required fields for ParseUser and ParseObject protocols
    var objectId: String?
    var username: String?
    var password: String?
    var email: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Custom fields for additional user information
    var petName: String?
    var petBreed: String?
    var petAge: Int?
    var petWeight: Double?
    var profilePhoto: ParseFile? // Optional profile photo for the user

    // Initializer with optional custom fields
    init(username: String? = nil, password: String? = nil, email: String? = nil, petName: String? = nil, petBreed: String? = nil, petAge: Int? = nil, petWeight: Double? = nil) {
        self.username = username
        self.password = password
        self.email = email
        self.petName = petName
        self.petBreed = petBreed
        self.petAge = petAge
        self.petWeight = petWeight
    }
    
    // Empty initializer required by ParseUser protocol
    init() {}
}
