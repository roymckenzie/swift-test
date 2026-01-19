//
//  Userable.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/17/26.
//

import Foundation

protocol Userable: Identifiable, Equatable {
    var id: UUID { get }
    var name: String { get }
    var age: Int { get }
}
