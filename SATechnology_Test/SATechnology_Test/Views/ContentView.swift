//
//  ContentView.swift
//  SATechnology_Test
//
//  Created by Vaishali Desale on 7/16/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var inspectionViewModel = InspectionViewModel()

    var body: some View {
        NavigationView {
            if authViewModel.isAuthenticated {
                InspectionListView(inspectionViewModel: inspectionViewModel)
            } else {
                AuthView(authViewModel: authViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
