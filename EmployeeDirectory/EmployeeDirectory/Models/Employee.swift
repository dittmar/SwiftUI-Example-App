//
//  Employee.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation

/// A basic employee that can be decoded from a JSON payload from the server
struct Employee: Identifiable, Decodable {
    let id: String
    let email: String?
    let name: String
    let phone: String?
    let photoURL: String?
    let team: Team
    let title: String
}
