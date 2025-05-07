//
//  EmployeeListView.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation
import Kingfisher
import SwiftUI

/// Lists all employees in returned from the server
struct EmployeeListView: View {
    @StateObject var employeeListViewModel: EmployeeListViewModel

    private var employees: [Employee] {
        employeeListViewModel.employees
    }

    var body: some View {
        NavigationStack {
            List(employees) { employee in
                NavigationLink(value: employee) {
                    EmployeeRowView(employee: employee)
                }
            }
            .navigationDestination(for: Employee.self) { employee in
                EmployeeDetailView(employee: employee)
            }
            .navigationTitle("Employee directory")
            .clipped()  // We don't want the employees scrolling through the status bar area
            .task {
                guard employees.isEmpty else { return }

                // When this view first appears, fetch employees from the server
                // TODO: (dittmar) make this read from persistence first and fall
                // back to hitting the server
                do {
                    employeeListViewModel.employees = try await GetEmployeesEndpoint().invoke()
                    // TODO: (dittmar) remove
                    // employees = try await GetEmployeesEndpoint().invoke()
                } catch {
                    let message = error.localizedDescription
                    // TODO: (dittmar) log error
                }
            }
            .refreshable {
                do {
                    employeeListViewModel.employees = try await GetEmployeesEndpoint().invoke()
                    // TODO: (dittmar) remove
                    // employees = try await GetEmployeesEndpoint().invoke()
                } catch {
                    let message = error.localizedDescription
                    // TODO: (dittmar) log error
                }
            }
        }
    }
}

#Preview {
    let employees = [
        Employee(
            id: UUID().uuidString,
            email: "dittmar@example.com",
            name: "Kevin Dittmar",
            phone: "(856) 555-0100",
            photoURL: nil,
            largePhotoURL: nil,
            biography: "Sample bio",
            team: .engineering,
            title: "Software Engineer",
        ),
        Employee(
            id: UUID().uuidString,
            email: nil,
            name: "John Smith",
            phone: nil,
            photoURL: nil,
            largePhotoURL: nil,
            biography: "Sample bio",
            team: .design,
            title: "UI Designer"
        ),
        Employee(
            id: UUID().uuidString,
            email: nil,
            name: "Job Dunn",
            phone: nil,
            photoURL: nil,
            largePhotoURL: nil,
            biography: "Sample bio",
            team: .product,
            title: "Product Manager"
        ),
        Employee(
            id: UUID().uuidString,
            email: "areallylongemailthattakesupalotofspace@example.com",
            name: "A Really Long Name That Takes Up a Lot of Space",
            phone: "(856) 555-0101 x123",
            photoURL: nil,
            largePhotoURL: nil,
            biography: "Sample bio",
            team: .hr,
            title: "A really long title that takes up a lot of space",
        )
    ]

    EmployeeListView(
        employeeListViewModel: EmployeeListViewModel(employees: employees)
    )
}
