//
//  SortOption.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/17/26.
//

import Foundation

enum UserSortOption<T: Userable>: String, CaseIterable, Identifiable {
    case FirstAZ, FirstZA, LastAZ, LastZA, OldestFirst, YoungestFirst, Created, Random
    var id: Self { self }
    
    var label: String {
        switch self {
        case .FirstAZ: return "First Name A-Z"
        case .FirstZA: return "First Name Z-A"
        case .LastAZ: return "Last Name A-Z"
        case .LastZA: return "Last Name Z-A"
        case .OldestFirst: return "Oldest First"
        case .YoungestFirst: return "Youngest First"
        case .Created: return "Created"
        case .Random: return "Random"
        }
    }
    
    var sortingFunction: (T, T) -> Bool {
        switch self {
        case .FirstAZ: return {
            if (firstName($0).localizedCaseInsensitiveCompare(firstName($1)) == .orderedSame) {
                return lastName($0).localizedCaseInsensitiveCompare(lastName($1)) == .orderedAscending
            }
            return firstName($0).localizedCaseInsensitiveCompare(firstName($1)) == .orderedAscending
        }
        case .FirstZA: return {
            if (firstName($0).localizedCaseInsensitiveCompare(firstName($1)) == .orderedSame) {
                return lastName($0).localizedCaseInsensitiveCompare(lastName($1)) == .orderedDescending
            }
            return firstName($0).localizedCaseInsensitiveCompare(firstName($1)) == .orderedDescending
        }
        case .LastAZ: return {
            if (lastName($0).localizedCaseInsensitiveCompare(lastName($1)) == .orderedSame) {
                return firstName($0).localizedCaseInsensitiveCompare(firstName($1)) == .orderedAscending
            }
            return lastName($0).localizedCaseInsensitiveCompare(lastName($1)) == .orderedAscending
        }
        case .LastZA: return {
            if (lastName($0).localizedCaseInsensitiveCompare(lastName($1)) == .orderedSame) {
                return firstName($0).localizedCaseInsensitiveCompare(firstName($1)) == .orderedDescending
            }
            return lastName($0).localizedCaseInsensitiveCompare(lastName($1)) == .orderedDescending
        }
        case .OldestFirst: return { $0.age > $1.age }
        case .YoungestFirst: return { $0.age < $1.age }
        case .Created: return { $0.id < $1.id }
        case .Random: return { _, _ in false }
        }
    }
    
    private func firstName(_ user: T) -> String {
        user.name.split(separator: " ").first.map(String.init) ?? ""
    }
    
    private func lastName(_ user: T) -> String {
        user.name.split(separator: " ").last.map(String.init) ?? ""
    }
}
