//
//  Model.swift
//  SATechnology_Test
//
//  Created by Vaishali Desale on 7/16/24.
//

import Foundation

struct Inspection: Codable {
    let id: Int
    let inspectionType: InspectionType
    let area: Area
    let survey: Survey
}

struct InspectionType: Codable {
    let id: Int
    let name: String
    let access: String
}

struct Area: Codable {
    let id: Int
    let name: String
}

struct Survey: Codable {
    let id: Int
    let categories: [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
    let questions: [Question]
}

struct Question: Codable {
    let id: Int
    let name: String
    let answerChoices: [AnswerChoice]
    var selectedAnswerChoiceId: Int?
}

struct AnswerChoice: Codable {
    let id: Int
    let name: String
    let score: Float
}

struct AuthResponse: Codable {
    let token: String
}

struct ErrorResponse: Codable {
    let error: String
}
