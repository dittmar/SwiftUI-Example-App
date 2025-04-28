//
//  EmployeeDirectoryApp.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import SwiftUI

@main
struct EmployeeDirectoryApp: App {
    var body: some Scene {
        WindowGroup {
            // TODO: (dittmar) read from persistence or server
            EmployeeListView(employees: [
                Employee(
                    id: UUID(),
                    name: "Kevin Dittmar",
                    title: "Software Engineer",
                    team: .engineering,
                    phoneNumber: "(856) 555-0100",
                    email: "dittmar@example.com"
                ),
                Employee(
                    id: UUID(),
                    name: "John Smith",
                    title: "UI Designer",
                    team: .design,
                    phoneNumber: nil,
                    email: nil
                ),
                Employee(
                    id: UUID(),
                    name: "Jane Doe",
                    title: "Sales Associate",
                    team: .finance,
                    phoneNumber: nil,
                    email: nil
                ),
                Employee(
                    id: UUID(),
                    name: "Job Dunn",
                    title: "Product Manager",
                    team: .product,
                    phoneNumber: nil,
                    email: nil
                ),
                Employee(
                    id: UUID(),
                    name: "A Really Long Name That Takes Up a Lot of Space",
                    title: "A really long title that takes up a lot of space",
                    team: .product,
                    phoneNumber: "(856) 555-0101 x123",
                    email: "areallylongemailthattakesupalotofspace@example.com"
                )
            ])
        }
    }
}
