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
                    Button("Phone: \(phone)") {
                        UIApplication.shared.open(URL(string: "tel://\(phone)")!)
                    }
                    .buttonStyle(.borderless)
                }
                if let email = employee.email {
                    Button("Email: \(email)") {
                        UIApplication.shared.open(URL(string: "mailto:\(email)")!)
                    }
                    .buttonStyle(.borderless)
                    .lineLimit(1)   // Limit to 1 line because wrapping makes the button wrap oddly
                }
            }

            Spacer()

            let size: CGFloat = 100
            if let photoURL = employee.photoURL {
                KFImage(URL(string: photoURL)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            } else {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: size))
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    EmployeeRowView(employee: Employee(
        id: UUID().uuidString,
        email: "jonathan.william.appleseed@example.com",
        name: "Doctor Jonathan William Appleseed, Jr.",
        phone: "(856) 555-0100",
        photoURL: nil,
        team: .engineering,
        title: "Junior Senior Staff Software Engineer"
    ))
}
