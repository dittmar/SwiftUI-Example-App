//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation

struct Employee: Identifiable, Codable {
    let id: UUID
    let name: String
    let title: String
    let team: Team
    let phoneNumber: String?
    let email: String?
}
