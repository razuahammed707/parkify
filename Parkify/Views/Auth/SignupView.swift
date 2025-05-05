//
//  SignupView.swift
//  Parkify
//
//  Created by Md Razu Ahammed Molla on 4/5/2025.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("🚗 Parkify")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Sign Up")
                .font(.title2)

            TextField("Full Name", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Create Account") {}
                .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    SignupView()
}
