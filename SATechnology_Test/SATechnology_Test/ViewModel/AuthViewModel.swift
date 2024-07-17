//
//  AuthViewModel.swift
//  SATechnology_Test
//
//  Created by Vaishali Desale on 7/16/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var errorMessage: String?

    func register() {
        guard !email.isEmpty, !password.isEmpty else {
            self.errorMessage = "Email and Password are required"
            return
        }
        
        let user = ["email": email, "password": password]
        NetworkManager.shared.register(user: user) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            self.errorMessage = "Email and Password are required"
            return
        }
        
        let user = ["email": email, "password": password]
        NetworkManager.shared.login(user: user) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
