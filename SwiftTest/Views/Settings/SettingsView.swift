//
//  SettingsView.swift
//  SwiftTest
//
//  Created by Roy McKenzie on 1/19/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                LabeledContent("iOS Version") {
                    Text(UIDevice.current.systemVersion)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
