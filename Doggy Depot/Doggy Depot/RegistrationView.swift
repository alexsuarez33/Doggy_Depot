//
//  RegistrationView.swift
//  Doggy Depot
//
//  Created by Anabella Amanau on 10/30/24.
//

import SwiftUI
import ParseSwift

struct RegistrationView: View {
    // State properties for each text field
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var petName: String = ""
    @State private var petBreed: String = ""
    @State private var petAge: String = ""
    @State private var petWeight: String = ""
    
    // State for handling errors
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            Color("BackgroundBeige")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                // Logo Placeholder
                Image("DoggyDepotLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, 15)

                // Title
                Text("Register")
                    .font(.custom("Avenir-Heavy", size: 30))
                    .foregroundColor(Color("WarmBrown"))

                // Form Fields with Reduced Padding
                Group {
                    TextField("Email", text: $email)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    TextField("Username", text: $username)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                        .autocapitalization(.none)

                    SecureField("Password", text: $password)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                    
                    TextField("Pet Name", text: $petName)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                    
                    TextField("Pet Breed", text: $petBreed)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                    
                    TextField("Pet Age", text: $petAge)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                    
                    TextField("Pet Weight (lbs)", text: $petWeight)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                }

                // Register Button with Adjusted Styling
                Button(action: registerUser) {
                    Text("Register")
                        .font(.custom("SFProRounded-Semibold", size: 18))
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color("WarmBrown"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
                }
                
                // Error message display
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.custom("SFProRounded-Regular", size: 14))
                        .padding(.top, 5)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
        }
    }
    
    private func registerUser() {
        // Check if a user is already logged in
        if User.current != nil {
            // Log out only if there's an active session
            User.logout { logoutResult in
                switch logoutResult {
                case .success:
                    // Proceed with signup after logout
                    self.performSignup()
                case .failure(let error):
                    print("Logout failed: \(error.localizedDescription)")
                    errorMessage = "Logout failed: \(error.localizedDescription)"
                }
            }
        } else {
            // If no user is logged in, directly proceed with signup
            performSignup()
        }
    }

    // Function to handle the signup process
    private func performSignup() {
        // Validate fields
        guard !email.isEmpty, !username.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, password == confirmPassword else {
            errorMessage = "Please fill in all fields and ensure passwords match."
            return
        }
        
        // Convert age and weight fields to appropriate types
        let petAgeInt = Int(petAge) ?? 0
        let petWeightDouble = Double(petWeight) ?? 0.0
        
        // Initialize a new User with the registration details
        var newUser = User(username: username,
                           password: password,
                           email: email,
                           petName: petName,
                           petBreed: petBreed,
                           petAge: petAgeInt,
                           petWeight: petWeightDouble)

        // Attempt to sign up the new user
        newUser.signup { result in
            switch result {
            case .success(let user):
                print("User registered successfully: \(user)")
                errorMessage = nil // Clear any existing error message
                // Proceed to the next screen or update the UI as needed
            case .failure(let error):
                print("Registration failed: \(error.localizedDescription)")
                errorMessage = "Registration failed: \(error.localizedDescription)"
            }
        }
    }
    
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
