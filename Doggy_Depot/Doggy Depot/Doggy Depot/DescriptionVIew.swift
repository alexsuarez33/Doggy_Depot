//
//  DescriptionVIew.swift
//  Doggy Depot
//
//  Created by Lucy Severo on 11/3/24.
//
import SwiftUI

struct DescriptionVIew: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundBeige")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) { // Remove spacing between elements
                    // Brown Header Bar
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
                                    .font(.system(size:25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                                NavigationLink(destination: WishlistPageView()) {
                                    Image(systemName: "heart.fill")
                                        .font(.system(size:27))
                                        .foregroundColor(.white)
                                }
                                Image(systemName: "cart.fill")
                                    .font(.system(size:27))
                                    .foregroundColor(.white)
                            }
                            .padding()
                        )

                    ScrollView { // Enable scrolling for the content
                        VStack(alignment: .leading, spacing: 20) {
                            // Product Image Box
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                
                                Image("SqueakyToy")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }
                            .frame(height: 200) // Set the height of the image box

                            // Product Name and Price
                            HStack {
                                Text("Multipet Gumby Plush Squeaky Dog Toy") // Updated product name
                                    .font(.title2) // Increased font size
                                    .fontWeight(.bold)
                                Spacer()
                                Text("$5.99") // Replace with your product price
                                    .font(.title2) // Increased font size
                                    .foregroundColor(.black)
                            }
                            
                            // Category
                            Text("Category: Toy") // Added category
                                .font(.system(size:20)) // Increased font size for category
                                .foregroundColor(.gray)

                            // Description of the product
                            Text("Add nostalgia to your dog’s playtime with the Multipet Gumby Plush Squeaky Toy! Soft and cuddly, it features a squeaker for extra fun during fetch. Toss Gumby around for a delightful adventure with your furry friend!")
                                .font(.body) // Keep body font size
                                .foregroundColor(.black.opacity(0.7))

                            // Dimensions
                            Text("Dimensions: 10 x 5 x 3 inches")
                                .font(.body) // Keep body font size
                                .foregroundColor(.black.opacity(0.7))

                            // Estimated Delivery Date
                            Text("Estimated Delivery: 3-5 business days")
                                .font(.body) // Keep body font size
                                .foregroundColor(.black.opacity(0.7))

                            Spacer(minLength: 50) // Spacer for visual balance at the bottom
                        }
                        .padding()
                    }
                    
                    // Buttons at the bottom
                    HStack {
                        Button(action: {
                            // Add to Cart action
                        }) {
                            Text("Add to Cart")
                                .font(.title2) // Increased font size
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.brown)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)

                        Button(action: {
                            // Return action
                        }) {
                            Text("Return")
                                .font(.title2) // Increased font size
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.brown)//.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

#Preview {
    DescriptionVIew()
}
