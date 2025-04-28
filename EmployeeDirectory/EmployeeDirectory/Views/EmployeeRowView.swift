//
//  EmployeeRowView.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation
import Kingfisher
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
                if let phone = employee.phone {
                    Text("Phone: \(phone)")
                }
                if let email = employee.email {
                    Text("Email: \(email)")
                }
            }
            Spacer()
            if let photoURL = employee.photoURL {
                KFImage(URL(string: photoURL)!)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fill)
            }
        }
        .padding()
    }
}

#Preview {
    EmployeeRowView(employee: Employee(
        id: UUID().uuidString,
        email: "dittmar@example.com",
        name: "Kevin Dittmar",
        phone: "(856) 555-0100",
        photoURL: nil,
        team: .engineering,
        title: "Software Engineer"
    ))
}
