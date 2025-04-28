//
//  Team.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

enum Team: String, CaseIterable, Codable {
    case design
    case engineering
    case finance
    case product
    
    var description: String {
        switch self {
        case .design: "Design"
        case .engineering: "Engineering"
        case .finance: "Finance"
        case .product: "Product"
        }
    }
}
