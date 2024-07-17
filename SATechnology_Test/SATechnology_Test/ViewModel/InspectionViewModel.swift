//
//  InspectionViewModel.swift
//  SATechnology_Test
//
//  Created by Vaishali Desale on 7/16/24.
//

import Foundation

class InspectionViewModel: ObservableObject {
    @Published var inspections: [Inspection] = []
    @Published var currentInspection: Inspection?
    @Published var errorMessage: String?

    func startInspection() {
        NetworkManager.shared.startInspection { result in
            switch result {
            case .success(let inspection):
                DispatchQueue.main.async {
                    self.currentInspection = inspection
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func submitInspection() {
        guard let inspection = currentInspection else { return }
        NetworkManager.shared.submitInspection(inspection: inspection) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.currentInspection = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
