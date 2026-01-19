//
//  Person.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/17/26.
//

import Foundation

struct Person: Userable, Decodable {
    let id: UInt
    let firstName: String
    let lastName: String
    let age: Int
    let sex: Sex
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case age
        case sex = "gender"
    }

    var name: String {
        return [firstName, lastName].joined(separator: " ")
    }
}
