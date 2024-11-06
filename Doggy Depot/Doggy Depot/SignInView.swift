//
//  ContentView.swift
//  Doggy Depot
//
//  Created by Anabella Amanau on 10/30/24.
//

import SwiftUI
import ParseSwift

struct SignInView: View {
    // State properties for the text fields
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? // To show error messages if sign-in fails
    
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
                    signInUser()
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
                
                // Error message display
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.custom("SFProRounded-Regular", size: 14))
                        .padding(.top, 5)
                }
                
                // Link to Registration Screen
                NavigationLink("Don't have an account? Register", destination: RegistrationView())
                    .font(.custom("SFProRounded-Regular", size: 16))
                    .foregroundColor(Color("WarmBrown"))
                    .padding(.top, 10)
            }
            .padding(.horizontal, 30)
            .padding(.top, 40)
        }
    }
    
    // Function to handle user sign-in
    private func signInUser() {
        // Basic check for empty fields
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both username and password."
            return
        }
        
        // Sign-in with Parse
        User.login(username: username, password: password) { result in
            switch result {
            case .success(let user):
                print("User signed in successfully: \(user)")
                errorMessage = nil // Clear any existing error message
                // Proceed to the next screen or update the UI as needed
            case .failure(let error):
                print("Sign-in failed: \(error.localizedDescription)")
                errorMessage = "Sign-in failed: \(error.localizedDescription)"
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
