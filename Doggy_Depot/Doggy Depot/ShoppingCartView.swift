//
//  ShoppingCartView.swift
//  Doggy Depot
//
//

import SwiftUI
import ParseSwift

struct ShoppingCartView: View {
    @State private var cartItems: [Item] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Loading Cart...")
                        .padding()
                } else if cartItems.isEmpty {
                    Text("Your cart is empty.")
                        .padding()
                } else {
                    List(cartItems, id: \.objectId) { item in
                        HStack {
                            // Display the item image
                            if let imageUrl = item.image?.url {
                                AsyncImage(url: imageUrl) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 60, height: 60)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                    case .failure:
                                        Text("Image failed to load")
                                            .frame(width: 60, height: 60)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(8)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                Text("No image available")
                                    .frame(width: 60, height: 60)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(item.name ?? "Unknown")
                                    .font(.headline)
                                Text("$\(item.price ?? 0.0, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Shopping Cart")
            .onAppear(perform: loadCartItems)
        }
    }
    
    private func loadCartItems() {
        guard let currentUser = User.current else {
            print("No user logged in")
            isLoading = false
            return
        }
        
        guard let userPointer = try? currentUser.toPointer() else {
            print("Failed to create pointer for user.")
            isLoading = false
            return
        }
        
        print("Fetching cart for user ID: \(userPointer.objectId)")
        
        let query = ShoppingCart.query("user" == userPointer)
        query.include("items") // Include items in the query
        query.first { result in
            switch result {
            case .success(let cart):
                if let itemPointers = cart.items {
                    let itemIds = itemPointers.compactMap { $0.objectId }
                    print("Cart contains item IDs: \(itemIds)")
                    fetchItemsFromPointers(itemPointers: itemPointers)
                } else {
                    print("Cart has no items.")
                    self.cartItems = []
                    self.isLoading = false
                }
            case .failure(let error):
                print("Failed to load cart: \(error.localizedDescription)")
                self.isLoading = false
            }
        }
    }
    
    private func fetchItemsFromPointers(itemPointers: [Pointer<Item>]) {
        let objectIds = itemPointers.compactMap { $0.objectId }
        print("Object IDs to fetch: \(objectIds)")
        
        guard !objectIds.isEmpty else {
            print("No valid object IDs found.")
            self.cartItems = []
            self.isLoading = false
            return
        }
        
        let itemQuery = Item.query("objectId" == objectIds)
        itemQuery.find { itemResult in
            switch itemResult {
            case .success(let items):
                print("Fetched items: \(items)")
                self.cartItems = items
            case .failure(let error):
                print("Failed to fetch items: \(error.localizedDescription)")
            }
            self.isLoading = false
        }
    }
}




#Preview {
    ShoppingCartView()
}
