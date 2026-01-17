//
//  SortOption.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/17/26.
//

enum UserSortOption<T: Userable>: String, CaseIterable, Identifiable {
    case FirstAZ, FirstZA, LastAZ, LastZA, OldestFirst, YoungestFirst, Random, Created
    var id: Self { self }
    
    var label: String {
        switch self {
        case .FirstAZ: return "First Name A-Z"
        case .FirstZA: return "First Name Z-A"
        case .LastAZ: return "Last Name A-Z"
        case .LastZA: return "Last Name Z-A"
        case .OldestFirst: return "Oldest First"
        case .YoungestFirst: return "Youngest First"
        case .Random: return "Random"
        case .Created: return "Created"
        }
    }
    
    var sortingFunction: (T, T) -> Bool {
        switch self {
        case .FirstAZ: return { $0.name < $1.name }
        case .FirstZA: return { $0.name > $1.name }
        case .LastAZ: return { $0.name.split(separator: " ")[1] < $1.name.split(separator: " ")[1] }
        case .LastZA: return { $0.name.split(separator: " ")[1] > $1.name.split(separator: " ")[1] }
        case .OldestFirst: return { $0.age > $1.age }
        case .YoungestFirst: return { $0.age < $1.age }
        case .Random: return { $0.id > $1.id }
        case .Created: return { $0.id < $1.id }
        }
    }
}
