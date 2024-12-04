import SwiftUI

struct ShoppingCartPage: View {
    @State private var cartItems: [CartItem] = []
    @State private var isLoading = true
    
    var totalAmount: Double {
        cartItems.reduce(0) { $0 + $1.price }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    Image("DoggyDepotLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    Text("Shopping Cart")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.black)
                
                
                if isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else if cartItems.isEmpty {
                    Text("Your cart is empty!")
                        .font(.headline)
                        .padding()
                } else {
                    List {
                        ForEach(cartItems, id: \.id) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text("$\(item.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Button(action: {
                                    removeItem(item)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
                // Total Amount and Buy Now Button
                if !cartItems.isEmpty {
                    VStack(spacing: 16) {
                        HStack {
                            Text("Total:")
                                .font(.headline)
                            Spacer()
                            Text("$\(totalAmount, specifier: "%.2f")")
                                .font(.headline)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            performCheckout()
                        }) {
                            Text("Buy Now")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
            .onAppear(perform: fetchCartItems)
            .navigationBarHidden(true)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private func fetchCartItems() {
        // Simulating database fetch with delay (replace with actual database logic)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.cartItems = [
                CartItem(id: "1", name: "Dog Food - 10 lbs", price: 25.99),
                CartItem(id: "2", name: "Chew Toy", price: 10.49),
                CartItem(id: "3", name: "Dog Sweater", price: 34.99)
            ]
            self.isLoading = false
        }
    }
    
    private func removeItem(_ item: CartItem) {
        // Simulate database remove operation
        cartItems.removeAll { $0.id == item.id }
    }
    
    private func performCheckout() {
        // Placeholder action for checkout
        print("Proceeding to checkout with total amount: $\(totalAmount)")
    }
}

struct CartItem: Identifiable {
    let id: String // Match database item ID
    let name: String
    let price: Double
}

struct ShoppingCartPage_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartPage()
    }
}
