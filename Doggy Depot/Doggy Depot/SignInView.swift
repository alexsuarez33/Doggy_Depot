//
//  ContentView.swift
//  Doggy Depot
//
//  Created by Anabella Amanau on 10/30/24.
//

import SwiftUI

struct SignInView: View {
    // State properties for the text fields
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            // Full screen background color
            Color("BackgroundBeige")
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Logo at the top
                Image("DoggyDepotLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .padding(.bottom, 30)

                // App Name
                Text("Doggy Depot")
                    .font(.custom("Avenir-Heavy", size: 34))
                    .foregroundColor(Color("WarmBrown"))
                
                // Username Text Field
                TextField("Username", text: $username)
                    .font(.custom("SFProRounded-Regular", size: 18))
                    .padding()
                    .background(Color("TextFieldBackground"))
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                // Password Text Field
                SecureField("Password", text: $password)
                    .font(.custom("SFProRounded-Regular", size: 18))
                    .padding()
                    .background(Color("TextFieldBackground"))
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
                
                // Sign In Button
                Button(action: {
                    // Handle sign-in logic here
                }) {
                    Text("Sign In")
                        .font(.custom("SFProRounded-Semibold", size: 18))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("WarmBrown"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
                }
                
                // Link to Registration Screen with matching color scheme
                NavigationLink("Don't have an account? Register", destination: RegistrationView())
                    .font(.custom("SFProRounded-Regular", size: 16))
                    .foregroundColor(Color("WarmBrown"))
                    .padding(.top, 10)
            }
            .padding(.horizontal, 30)
            .padding(.top, 40)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
