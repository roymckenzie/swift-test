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
    
    enum FocusedField {
        case name, age, sex
    }
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: Int?
    @State private var sex: Sex = .female
    @FocusState private var firstNameIsFocused: Bool

    @State private var isShowingValidationAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Details") {
                    TextField("First name", text: $firstName)
                        .textInputAutocapitalization(.words)
                        .focused($firstNameIsFocused)
                    TextField("Last name", text: $lastName)
                        .textInputAutocapitalization(.words)
                    TextField("Age", value: $age, format: .number)
                        .keyboardType(.numberPad)
                    Picker("Sex", selection: $sex) {
                            ForEach(Sex.allCases) { sex in
                                Text(sex.rawValue.capitalized)
                            }
                        }
                }
                Button("Save") {
                    guard let age = age, firstName.count > 0, lastName.count > 0 else {
                        isShowingValidationAlert = true
                        return
                    }
                    let person = Person(
                        id: UUID().hashValue.magnitude,
                        firstName: firstName,
                        lastName: lastName,
                        age: age,
                        sex: sex
                    )
                    peopleManager.add(person)
                    dismiss()
                }
            }
            .onAppear() {
                firstNameIsFocused = true
            }
            .navigationTitle("Add new person")
            .toolbar {
                Button("Cancel") {
                    dismiss()
                }
            }
            .alert("Oops", isPresented: $isShowingValidationAlert) {
                
            } message: {
                Text("Please provide the person's name, age, and sex.")
            }
        }
    }
}

#Preview {
    AddPersonView()
        .environmentObject(PeopleManager())
}
