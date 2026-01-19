//
//  PeopleManager.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/19/26.
//

import Foundation
internal import Combine

@MainActor
final class PeopleManager: ObservableObject {
    @Published private(set) var people: [Person] = [
        Person(id: UUID().hashValue.magnitude, firstName: "Roy", lastName: "McKenzie", age: 43, sex: .male),
        Person(id: UUID().hashValue.magnitude, firstName: "Frank", lastName: "Baum", age: 40, sex: .male),
        Person(id: UUID().hashValue.magnitude, firstName: "Sam", lastName: "Altman", age: 46, sex: .male),
        Person(id: UUID().hashValue.magnitude, firstName: "Jane", lastName: "Bond", age: 36, sex: .female),
        Person(id: UUID().hashValue.magnitude, firstName: "Albert", lastName: "Baum", age: 65, sex: .male),
    ]
    
    func add(_ person: Person) {
        if let _ = people.firstIndex(where: { $0.id == person.id }) {
            return
        }
        people.append(person)
    }
    
    func remove(_ person: Person) {
        people.removeAll { $0.id == person.id }
    }
    
    func update(_ person: Person) {
        guard let index = people.firstIndex(where: { $0.id ==  person.id }) else {
            return
        }
        people[index] = person
    }
    
    func loadMore() async {
        let usersEndpoint = "https://dummyjson.com/users"
        guard let url = URL(string: usersEndpoint) else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(UserResponse.self, from: data)
            decodedResponse.users.forEach { add($0) }
        } catch {
            print("Failed to load users: \(error)")
        }
    }
}

