//
//  ContentView.swift
//  Doggy Depot
//
//  Created by Antonella Quiroga on 10/29/24.
//

import SwiftUI

struct Landingpage: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    
                    Image("logo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                    Text("Doggy Depot")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    NavigationLink(destination: WishlistPageView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Image(systemName: "cart.fill")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 40)
                .padding(.vertical, 10) 
                .padding(.horizontal)
                .background(Color.black)
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search for products", text: $searchText)
                        .foregroundColor(.primary)
                }
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
                
                // Sections
                VStack(alignment: .leading, spacing: 16) {
                    SectionLink(title: "Food")
                    SectionLink(title: "Toys")
                    SectionLink(title: "Treats")
                    SectionLink(title: "Medicine")
                    SectionLink(title: "Clothes")
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}


struct SectionLink: View {
    var title: String
    
    var body: some View {
        NavigationLink(destination: CategoryView(category: title)) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}


struct CategoryView: View {
    var category: String
    
    var body: some View {
        Text("\(category) Products")
            .font(.largeTitle)
            .padding()
    }
}
