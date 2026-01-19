//
//  Sex.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/19/26.
//

enum Sex: String, CaseIterable, Identifiable, Codable {
    case female, male
    var id: Self { self }
}
