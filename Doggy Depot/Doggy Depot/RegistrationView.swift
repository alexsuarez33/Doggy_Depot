//
//  RegistrationView.swift
//  Doggy Depot
//
//  Created by Anabella Amanau on 10/30/24.
//

import SwiftUI

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
                    
                    TextField("Pet Weight", text: $petWeight)
                        .font(.custom("SFProRounded-Regular", size: 16))
                        .padding(.vertical, 10)
                        .background(Color("TextFieldBackground"))
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1)
                }

                // Register Button with Adjusted Styling
                Button(action: {
                    // Handle registration logic
                }) {
                    Text("Register")
                        .font(.custom("SFProRounded-Semibold", size: 18))
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color("WarmBrown"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
