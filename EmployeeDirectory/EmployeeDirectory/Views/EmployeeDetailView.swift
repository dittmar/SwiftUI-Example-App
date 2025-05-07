//
//  EmployeeDetailView.swift
//  EmployeeDirectory
//
//  Created by Kevin Dittmar on 5/6/25.
//
import Kingfisher
import SwiftUI

struct EmployeeDetailView: View {
    @State private(set) var employee: Employee

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("\(employee.name)")
                        .font(.title)
                    if let imageURL = employee.largePhotoURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                maxWidth: geometry.size.width,
                                maxHeight: geometry.size.height
                            )
                    }
                    if let biography = employee.biography {
                        Text("Bio:\n\(biography)")
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    EmployeeDetailView(
        employee: Employee(
            id: UUID().uuidString,
            email: "dittmar@example.com",
            name: "Kevin Dittmar",
            phone: "(856) 555-0100",
            photoURL: "https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=200&w=200",
            largePhotoURL: "https://images.pexels.com/photos/1040881/pexels-photo-1040881.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=1200",
            biography: "Kevin is an iOS engineer who likes to ballroom dance, play video games, and play board games.",
            team: .engineering,
            title: "Software Engineer"
        )
    )
}
