//
//  LandingPage.swift
//  Doggy Depot
//
//  Created by Antonella Quiroga on 10/30/24.
//

import SwiftUI

// Item struct to represent each product
struct Item: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var imageName: String
}

struct LandingPage: View {
    @State private var searchText = ""
    
    // Sample data for items in each category
    let foodItems: [Item] = [
        Item(name: "Dry Dog Food", price: 10.99, imageName: "food1"),
        Item(name: "Canned Dog Food", price: 5.99, imageName: "food2"),
        Item(name: "Wet Dog Food Variety", price: 22.99, imageName: "food3")
    ]
    
    let toyItems: [Item] = [
        Item(name: "Squeaky Toy", price: 5.99, imageName: "SqueakyToy"),
        Item(name: "Rope Toy", price: 7.99, imageName: "toy2"),
        Item(name: "Chew Bone", price: 3.99, imageName: "toy3")
    ]
    
    let treatItems: [Item] = [
        Item(name: "Dental Sticks", price: 3.99, imageName: "treat1"),
        Item(name: "Jerky Treats", price: 4.99, imageName: "treat2"),
        Item(name: "Biscuits", price: 2.99, imageName: "treat3")
    ]
    
    let medicineItems: [Item] = [
        Item(name: "Flea Medicine", price: 12.99, imageName: "medicine1"),
        Item(name: "Joint Supplements", price: 14.99, imageName: "medicine2"),
        Item(name: "Digestive Aid", price: 9.99, imageName: "medicine3")
    ]
    
    let clothingItems: [Item] = [
        Item(name: "Raincoat", price: 29.99, imageName: "clothing1"),
        Item(name: "Sweater", price: 19.99, imageName: "clothing2"),
        Item(name: "Booties", price: 14.99, imageName: "clothing3")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                HStack {
                    Image("DoggyDepotLogo")
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
                    
                // Sections with Item data
                VStack(alignment: .leading, spacing: 16) {
                    SectionLink(title: "Food", items: foodItems)
                    SectionLink(title: "Toys", items: toyItems)
                    SectionLink(title: "Treats", items: treatItems)
                    SectionLink(title: "Medicine", items: medicineItems)
                    SectionLink(title: "Clothes", items: clothingItems)
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

// Section link view for each category
struct SectionLink: View {
    var title: String
    var items: [Item]
    
    var body: some View {
        NavigationLink(destination: CategoryView(category: title, items: items)) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}

// Category View to show items in each category
struct CategoryView: View {
    var category: String
    var items: [Item]
    
    var body: some View {
        VStack {
            Text("\(category) Products")
                .font(.largeTitle)
                .padding()
            
            List(items) { item in
                HStack {
                    // Product Image
                    Image(item.imageName) // Assuming image name matches item name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.leading)
                    
                    // Product Name
                    Text(item.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    // Product Price
                    Text("$\(item.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.trailing)
                    
                    // "View" Button
                    NavigationLink(destination: DescriptionView(itemName: item.name, category: category, imageName: item.imageName)) {
                        Text("View")
                            .font(.body)
                            .foregroundColor(.blue)
                            .padding(.trailing)
                    }
                }
                .padding([.top, .bottom], 8)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 4)
            }
            .listStyle(PlainListStyle()) // Removes the default List styling
        }
    }
}

// Description view for the selected item
struct DescriptionView: View {
    var itemName: String
    var category: String
    var imageName: String // Added to accept imageName from CategoryView
    
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
                                
                                Image(imageName) // Use the imageName passed from CategoryView
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
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
                    
                    // Only the Add to Cart Button now
                    Button(action: {
                        // Add to Cart action (not connected yet)
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
                    .padding(.bottom, 30) // Adds some bottom padding
                }
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
