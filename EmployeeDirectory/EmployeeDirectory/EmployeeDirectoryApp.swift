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
            EmployeeListView(employeeListViewModel: EmployeeListViewModel(employees: []))
        }
    }
}
