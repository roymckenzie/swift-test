//
//  SettingsView.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/19/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var peopleManager: PeopleManager
    
    var body: some View {
        NavigationStack {
            Form {
                LabeledContent("iOS Version") {
                    Text(UIDevice.current.systemVersion)
                }
                LabeledContent("Total People") {
                    Text("\(peopleManager.people.count)")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    let peopleManager = PeopleManager()
    SettingsView()
        .environmentObject(peopleManager)
}
