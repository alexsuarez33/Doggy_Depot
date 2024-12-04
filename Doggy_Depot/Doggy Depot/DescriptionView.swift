//
//  DescriptionView.swift
//  Doggy Depot
//

import SwiftUI
import ParseSwift

struct DescriptionView: View {
    var objectId: String // Added to reference the item in the database
    var itemName: String
    var category: String
    var imageUrl: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundBeige")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Header
                    Rectangle()
                        .fill(Color.brown)
                        .frame(height: 80)
                        .overlay(
                            HStack {
                                Image("DoggyDepotLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                Text("Doggy Depot")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                                NavigationLink(destination: WishlistPageView()) {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size: 27))
                                        .foregroundColor(.white)
                                }
                            }
                                .padding()
                        )
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            // Product Image
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                
                                if let url = URL(string: imageUrl) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(10)
                                        case .failure:
                                            Text("Image failed to load")
                                                .foregroundColor(.red)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Text("Invalid image URL")
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(height: 200)
                            
                            // Product Name
                            Text(itemName)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            // Category
                            Text("Category: \(category)")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            // Description
                            Text("This is a description of the \(itemName). It is a wonderful product for your dog, offering high quality and exceptional value.")
                                .font(.body)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        .padding()
                    }
                    
                    // Add to Cart Button
                    Button(action: {
                        addToCart(objectId: objectId)
                    }) {
                        Text("Add to Cart")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
        }
    }
    
    func addToCart(objectId: String) {
        guard let currentUser = User.current else {
            print("No user logged in")
            return
        }
        
        guard let userPointer = try? currentUser.toPointer() else {
            print("Failed to create pointer for user.")
            return
        }
        
        // Query for the current user's shopping cart
        let query = ShoppingCart.query("user" == userPointer)
        query.first { result in
            switch result {
            case .success(let cart):
                // Update existing cart
                var updatedCart = cart
                if updatedCart.items == nil {
                    updatedCart.items = []
                }
                updatedCart.items?.append(Pointer<Item>(objectId: objectId)) // Add item to the cart
                updatedCart.save { saveResult in
                    switch saveResult {
                    case .success:
                        print("Item added to cart")
                    case .failure(let error):
                        print("Failed to add item: \(error.localizedDescription)")
                    }
                }
                
            case .failure:
                // Create a new cart if none exists
                var newCart = ShoppingCart()
                newCart.user = userPointer
                newCart.items = [Pointer<Item>(objectId: objectId)]
                newCart.save { saveResult in
                    switch saveResult {
                    case .success:
                        print("Cart created and item added")
                    case .failure(let error):
                        print("Failed to create cart: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}
