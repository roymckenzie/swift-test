//
//  PersonView.swift
//  Test
//
//  Created by Roy McKenzie on 1/16/26.
//

import SwiftUI

struct PersonView: View {
    @EnvironmentObject private var peopleManager: PeopleManager
    @Environment(\.dismiss) private var dismiss
    @State private var isPresentingConfirm: Bool = false
    private var person: Person
    
    init(for person: Person) {
        self.person = person
    }
    
    var body: some View {
        Form {
            Section("Details") {
                LabeledContent("Name") {
                    Text(person.name)
                }
                LabeledContent("Age") {
                    Text("\(person.age)")
                }
                LabeledContent("ID") {
                    Text("\(person.id)")
                        .lineLimit(1)
                        .frame(maxWidth: 200)
                }
            }
            Button("Delete", role: .destructive) {
                isPresentingConfirm = true
            }
            .confirmationDialog(
                "Are you sure?",
                isPresented: $isPresentingConfirm
            ) {
                Button(
                    "Yes, delete.",
                    role: .destructive
                ) {
                    peopleManager.remove(person)
                    dismiss()
                }
            }
        }
        .navigationTitle("Person")
    }
}

#Preview {
    let peopleManager = PeopleManager()
    NavigationView {
        PersonView(for: peopleManager.people.first!)
            .environmentObject(peopleManager)
    }
}

