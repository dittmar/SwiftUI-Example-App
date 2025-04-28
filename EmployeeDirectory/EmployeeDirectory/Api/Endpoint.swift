//
//  Endpoint.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 4/28/25.
//

import Foundation

/// Define the HTTP methods we can use for our endpoints
enum HttpMethod {
    case get
    case put
    case post
    case delete
}

/// Define an endpoint.  We need to know what HTTP method to use, which path to use, and what the endpoint returns, if anything.
/// Currently, we only have one GET endpoint, so the HttpMethod isn't really necessary, and put, post, and delete are unused.
protocol Endpoint {
    /// The response for the endpoint has to be decodable
    associatedtype Response: Decodable
    
    /// The HTTP method should be a GET, PUT, POST, or DELETE
    var method: HttpMethod { get }
    
    /// The path for the endpoint
    var path: String { get }
    
    /// invokes the endpoint so that we make the network call and get a response
    func invoke(urlSession: URLSession) async throws -> Response
}
