//
//  PeopleView.swift
//  Test
//
//  Created by Roy McKenzie on 1/16/26.
//

import SwiftUI

struct PeopleView: View {
    @EnvironmentObject var peopleManager: PeopleManager
    @State private var isPresentingAddNew = false
    @State private var selectedSortOption: UserSortOption<Person> = .FirstAZ
    
    @State private var isLoadingMore = false
    
    private var sortedUsers: [Person] {
        if selectedSortOption == .Random {
            return peopleManager.people.shuffled()
        }
        return peopleManager.people.sorted(by: selectedSortOption.sortingFunction)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    Section {
                        Picker(selection: $selectedSortOption) {
                            ForEach(UserSortOption<Person>.allCases) { sortOption in
                                Text(sortOption.label)
                            }
                        } label: {
                            Text("Sort Option")
                        }
                    }
                    Section("People") {
                        PersonTableView(items: sortedUsers)
                    }
                    Section {
                        Button("Add New") {
                            isPresentingAddNew = true
                        }
                    }
                    Button {
                        Task {
                            isLoadingMore = true
                            await peopleManager.loadMore()
                            isLoadingMore = false
                        }
                    } label: {
                        if isLoadingMore {
                            HStack {
                                Text("Loading")
                                Spacer()
                                ProgressView()
                            }
                        } else {
                            Text("Load More")
                        }
                    }
                }
                .animation(.default, value: sortedUsers)
            }
            .sheet(isPresented: $isPresentingAddNew) {
                AddPersonView()
            }
            .navigationTitle("People")
        }
    }
}

#Preview {
    let peopleManager = PeopleManager()
    return PeopleView()
        .environmentObject(peopleManager)
}
