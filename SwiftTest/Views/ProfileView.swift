//
//  SuccessView.swift
//  Test
//
//  Created by Roy McKenzie on 1/16/26.
//

import SwiftUI

struct ProfileView: View {
    
    private var person: Person
    
    init(for person: Person) {
        self.person = person
    }
    
    var body: some View {
        List {
            HStack {
                Text("Name")
                Spacer()
                Text(person.name)
                    .foregroundStyle(.gray)
            }
            HStack {
                Text("Age")
                Spacer()
                Text("\(person.age)")
                    .foregroundStyle(.gray)
            }
        }
        .navigationTitle("Person")
    }
}

#Preview {
    ProfileView(for: Person(id: 1, name: "Roy McKenzie", age: 43))
}
