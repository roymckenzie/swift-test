//
//  AddPersonView.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/19/26.
//

import SwiftUI

struct AddPersonView: View {
    @EnvironmentObject private var peopleManager: PeopleManager
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var age: Int?
    
    @State private var isShowingValidationAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Details") {
                    TextField("Name", text: $name)
                        .textInputAutocapitalization(.words)
                    TextField("Age", value: $age, format: .number)
                        .keyboardType(.numberPad)
                }
                Button("Save") {
                    guard let age = age, name.count > 0 else {
                        isShowingValidationAlert = true
                        return
                    }
                    let person = Person(id: UUID(), name: name, age: age)
                    peopleManager.add(person)
                    dismiss()
                }
            }
            .navigationTitle("Add new person")
            .toolbar {
                Button("Cancel") {
                    dismiss()
                }
            }
            .alert("Oops", isPresented: $isShowingValidationAlert) {
                
            } message: {
                Text("Please provide the person's name and age.")
            }
        }
    }
}

#Preview {
    AddPersonView()
        .environmentObject(PeopleManager())
}
