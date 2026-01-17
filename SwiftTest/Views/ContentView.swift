//
//  ContentView.swift
//  Test
//
//  Created by Roy McKenzie on 1/16/26.
//

import SwiftUI

struct ContentView: View {
            
    private var users: [Person] = [
        Person(id: 1, name: "Roy McKenzie", age: 43),
        Person(id: 2, name: "Frank Baum", age: 40),
        Person(id: 3, name: "Sam Altman", age: 46),
        Person(id: 4, name: "James Bond", age: 36)
    ]
    
    @State private var selectedSortOption: UserSortOption<Person> = .FirstAZ
    
    private var sortedUsers: [Person] {
        if selectedSortOption == .Random {
            return users.shuffled()
        }
        return users.sorted(by: selectedSortOption.sortingFunction)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    Section {
                        Picker(selection: $selectedSortOption) {
                            ForEach(UserSortOption<Person>.allCases) { sortOption in
                                Text("\(sortOption.label)")
                            }
                        } label: {
                            Text("Sort Option")
                        }
                    }
                    Section {
                        DataTableView(items: sortedUsers)
                    }
                }
                .animation(.default, value: sortedUsers)
            }
            .navigationTitle("People")
        }
    }
}

#Preview {
    ContentView()
}
