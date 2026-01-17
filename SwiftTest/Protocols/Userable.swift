//
//  Userable.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/17/26.
//

protocol Userable: Identifiable, Equatable {
    var id: Int { get }
    var name: String { get }
    var age: Int { get }
}
