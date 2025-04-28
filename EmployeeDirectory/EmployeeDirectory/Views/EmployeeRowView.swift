//
//  EmployeeRowView.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation
import SwiftUI

/// Lists all relevant information for an individual employee, including
/// a picture of them
struct EmployeeRowView: View {
    var employee: Employee
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(employee.name)
                Text(employee.title)
                Text(employee.team.description)
                if let phoneNumber = employee.phoneNumber {
                    Text("Phone: \(phoneNumber)")
                }
                if let email = employee.email {
                    Text("Email: \(email)")
                }
            }
            Spacer()
            // TODO: (dittmar) this needs to be replaced with a picture
            Image(systemName: "person.circle")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 60, height: 60)
        }
        .padding()
    }
}

#Preview {
    EmployeeRowView(employee: Employee(
        id: UUID(),
        name: "Kevin Dittmar",
        title: "Software Engineer",
        team: .engineering,
        phoneNumber: "(856) 555-0100",
        email: "dittmar@example.com"
    ))
}
