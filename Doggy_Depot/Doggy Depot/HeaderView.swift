//
//  HeaderView.swift
//  Doggy Depot
//

import SwiftUI
import Foundation
import ParseSwift

struct HeaderView: View {
    @State private var cartItemCount: Int = 0 // State to track cart item count
    
    var body: some View {
        HStack {
            Image("DoggyDepotLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
            Text("Doggy Depot")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.backgroundBeige)
            
            Spacer()
            
            // Wishlist Button
            NavigationLink(destination: WishlistPageView()) {
                Image(systemName: "heart.fill")
                    .font(.title2)
                    .foregroundColor(.textFieldBackground)
            }
            .padding(.trailing, 10)
            
            // Shopping Cart Button with Badge
            ZStack {
                NavigationLink(destination: ShoppingCartView()) {
                    Image(systemName: "cart.fill")
                        .font(.title2)
                        .foregroundColor(.textFieldBackground)
                }
                
                // Badge for item count
                if cartItemCount > 0 {
                    Text("\(cartItemCount)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Circle().fill(Color.red))
                        .offset(x: 12, y: -12) // Positioning the badge
                }
            }
        }
        .padding(.top, 40)
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.warmBrown)
        .onAppear(perform: fetchCartItemCount) // Fetch cart item count when header appears
    }
    
    // Function to fetch cart item count
    private func fetchCartItemCount() {
        guard let currentUser = User.current else {
            print("No user logged in")
            cartItemCount = 0
            return
        }
        
        guard let userPointer = try? currentUser.toPointer() else {
            print("Failed to create pointer for user.")
            cartItemCount = 0
            return
        }
        
        // Correct query
        let query = ShoppingCart.query("user" == userPointer)
        query.first { (result: Result<ShoppingCart, ParseError>) in
            switch result {
            case .success(let cart):
                cartItemCount = cart.items?.count ?? 0
            case .failure(let error):
                print("Failed to fetch cart item count: \(error.localizedDescription)")
                cartItemCount = 0
            }
        }
    }
}



#Preview {
    HeaderView()
}
