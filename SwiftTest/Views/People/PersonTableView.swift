//
//  PersonTableView.swift
//  Test
//
//  Created by Roy McKenzie on 1/16/26.
//

import SwiftUI

struct PersonTableView: View {
    @EnvironmentObject private var peopleManager: PeopleManager
    
    var data: [Person] = []
    
    init(items: [Person]) {
        data = items
    }
    
    var body: some View {
        ForEach(data) { person in
            NavigationLink {
                PersonView(for: person)
            } label: {
                HStack() {
                    Text(person.name)
                    Spacer()
                    Text("\(person.age)")
                        .foregroundStyle(.gray)
                }
            }
            .swipeActions {
                Button(
                    "Delete",
                    role: .destructive
                ) {
                    peopleManager.remove(person)
                }
            }
        }
    }
}

#Preview {
    let peopleManager = PeopleManager()
    List {
        PersonTableView(items: peopleManager.people)
            .environmentObject(peopleManager)
    }
}
