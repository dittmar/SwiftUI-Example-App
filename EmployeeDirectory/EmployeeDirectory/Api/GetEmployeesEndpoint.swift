//
//  GetEmployeesEndpoint.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation

/// A simple GET endpoint to retrieve the list of employees from the "server", which is a static JSON file in the repo
struct GetEmployeesEndpoint: Endpoint {
    typealias Response = [Employee]
    let method: HttpMethod = .get
    let path = "https://dittmar.github.io/SwiftUI-Example-App/employees.json"
    
    /// Pulls employees from the server and returns them.
    /// - Parameter urlSession is the URLSession object used to configure the request.  It defaults to `.shared`.
    /// - Throws an error if the endpoint URL is invalid or the JSON payload cannot be decoded
    func invoke(urlSession: URLSession = .shared) async throws -> Response {
        guard let url = URL(string: path) else {
            // TODO: (dittmar) throw a real non-fatal error
            fatalError("Path is not a URL")
        }
        // We don't do anything with the response that we get back, so ignore it with _
        let (data, _) = try await urlSession.data(from: url)
        return try JSONDecoder().decode(Response.self, from: data)
    }
}
