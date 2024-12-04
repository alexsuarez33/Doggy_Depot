//
//  LandingPage.swift
//  Doggy Depot
//
//  Created by Antonella Quiroga on 10/30/24.
//

import SwiftUI



import SwiftUI

struct LandingPage: View {
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                
                // Header
                HeaderView()
                    .padding(.top, 60)
                // Sections without preloaded data
                VStack(alignment: .leading, spacing: 16) {
                    SectionLink(title: "Food", category: "Food")
                    SectionLink(title: "Toys", category: "Toys")
                    SectionLink(title: "Treats", category: "Treats")
                    SectionLink(title: "Medicine", category: "Medicine")
                    SectionLink(title: "Clothes", category: "Clothes")
                }
                .padding(.horizontal)

                Spacer()
            }
            
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
