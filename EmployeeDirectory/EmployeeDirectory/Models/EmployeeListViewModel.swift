//
//  EmployeeListViewModel.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 5/6/25.
//

import Foundation

class EmployeeListViewModel: ObservableObject {
    @Published
    var employees: [Employee] = []
    
    init(employees: [Employee]) {
        self.employees = employees
    }
}
