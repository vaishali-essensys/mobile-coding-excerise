//
//  InspectionListView.swift
//  SATechnology_Test
//
//  Created by Vaishali Desale on 7/16/24.
//

import SwiftUI

struct InspectionListView: View {
    @ObservedObject var inspectionViewModel: InspectionViewModel

    var body: some View {
        List(inspectionViewModel.inspections, id: \.id) { inspection in
            Text(inspection.area.name)
        }
        .navigationBarTitle("Inspections")
        .navigationBarItems(trailing: Button("Start Inspection") {
            inspectionViewModel.startInspection()
        })
    }
}
