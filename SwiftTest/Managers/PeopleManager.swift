//
//  PeopleManager.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/19/26.
//

import Foundation
internal import Combine

final class PeopleManager: ObservableObject {
    @Published private(set) var people: [Person] = [
        Person(id: UUID(), name: "Roy McKenzie", age: 43),
        Person(id: UUID(), name: "Frank L Baum", age: 40),
        Person(id: UUID(), name: "Sam Altman", age: 46),
        Person(id: UUID(), name: "James Bond", age: 36),
        Person(id: UUID(), name: "Albert J Baum", age: 65),
    ]
    
    func add(_ person: Person) {
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
}
