//
//  AuthView.swift
//  SATechnology_Test
//
//  Created by Vaishali Desale on 7/16/24.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $authViewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $authViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: authViewModel.login) {
                Text("Login")
            }
            .padding()
            
            Button(action: authViewModel.register) {
                Text("Register")
            }
            .padding()
        }
        .padding()
    }
}
