//
//  Team.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

/// `Team` describes which team an `Employee` is on.  A Software Engineer will be on the Engineering team
/// for example.
enum Team: String, CaseIterable, Decodable {
    case design
    case engineering
    case finance
    case hr
    case product
    
    /// Describes the team in well-formated, human-readable text.
    // TODO: (dittmar) localize
    var description: String {
        switch self {
        case .design: "Design"
        case .engineering: "Engineering"
        case .finance: "Finance"
        case .hr: "HR"
        case .product: "Product"
        }
    }
}
