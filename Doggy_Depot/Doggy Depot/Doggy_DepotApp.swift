//
//  Doggy_DepotApp.swift
//  Doggy Depot
//
//  Created by Anabella Amanau on 10/30/24.
//

import SwiftUI
import ParseSwift
import Foundation

@main
struct DoggyDepotApp: App {
    init() {
        ParseSwift.initialize(applicationId: "nVvIUzm0yxcJdz4PZFhMHGTFkgSM4tkimvQzNAbd",
                              clientKey: "gCEq4vjVcGhkxs0Q61VQBNRij8VDj2EivSB3pwk5",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SignInView()
            }
        }
    }
}
