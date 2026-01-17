//
//  DataTableView.swift
//  Test
//
//  Created by Roy McKenzie on 1/16/26.
//

import SwiftUI

struct DataTableView: View {
    
    var data: [Person] = []
    
    init(items: [Person]) {
        data = items
    }
    
    var body: some View {
        ForEach(data) { person in
            NavigationLink {
                ProfileView(for: person)
            } label: {
                HStack() {
                    Text(person.name)
                    Spacer()
                    Text("\(person.age)")
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}
