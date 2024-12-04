import SwiftUI

struct ContentView: View {
    
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
                                        Image(systemName: "heart.fill")
                                            .font(.system(size:27))
                                            .foregroundColor(.white)
                                    
                                    Image(systemName: "cart.fill")
                                        .font(.system(size:27))
                                        .foregroundColor(.white)
                                }
                                .padding()
                            )
                        Spacer()
                        
                        Rectangle()
                            .fill(Color.brown)
                            .frame(height: 40)
                            .overlay(
                                HStack {
                                    Image("DoggyDepotLogo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10, height: 30)
                                    Text("Food Selection")
                                        .font(.system(size:25))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding()
                            )

                        ScrollView(.horizontal) { // Enable scrolling for the content
                            VStack(alignment: .leading, spacing: 20) {
                                // Product Image Box
                                ZStack {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                    HStack {
                                        Image("food1")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Image("food2")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Image("food3")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                    }
                                }
                        
                                .frame(height: 200) // Set the height of the image
                            }
                            .padding()
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .fill(Color.brown)
                            .frame(height: 40)
                            .overlay(
                                HStack {
                                    Image("DoggyDepotLogo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10, height: 30)
                                    Text("Premium Toys")
                                        .font(.system(size:25))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding()
                            )

                        ScrollView(.horizontal) { // Enable scrolling for the content
                            VStack(alignment: .leading, spacing: 20) {
                                // Product Image Box
                                ZStack {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                    HStack {
                                        Image("toy1")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Image("toy2")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        Image("toy3")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                    }
                                }
                        
                                .frame(height: 200) // Set the height of the image
                            }
                            .padding()
                        }
                        Spacer()
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
                                Text("Add to Wish")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
