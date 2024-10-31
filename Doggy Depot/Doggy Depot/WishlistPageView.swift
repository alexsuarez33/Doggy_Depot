//
//  WishlistPageView.swift
//  Doggy Depot
//
//  Created by Antonella Quiroga on 10/30/24.
//

import Foundation
import SwiftUI

// Product Model
struct Product: Identifiable {
    let id = UUID() 
    var name: String
    var quantity: Int
    var price: Double
}

struct WishlistPageView: View {
    @State private var products: [Product] = [
        Product(name: "Dog Food", quantity: 1, price: 29.99),
        Product(name: "treats", quantity: 2, price: 14.99),
        Product(name: "Pet Shampoo", quantity: 1, price: 12.99),
        Product(name: "Dog Leash", quantity: 1, price: 19.99)
    ]
    
    var body: some View {
        VStack {
            Text("Your Wishlist")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(products) { product in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)
                            Text("Quantity: \(product.quantity)")
                            Text(String(format: "Price: $%.2f", product.price))
                        }
                        Spacer()
                        Button(action: {
                        
                            addToCart(product: product)
                        }) {
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.black)
                                .cornerRadius(5)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private func addToCart(product: Product) {
        print("Added \(product.name) to cart.")
    }
}


struct WishlistPageView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistPageView()
    }
}
