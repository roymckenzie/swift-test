//
//  SwiftTestApp.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/17/26.
//

import SwiftUI

@main
struct SwiftTestApp: App {
    @StateObject private var peopleManager = PeopleManager()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .environmentObject(peopleManager)
                    .tabItem {
                        Label("People", systemImage: "person.3.sequence")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        }
    }
}
