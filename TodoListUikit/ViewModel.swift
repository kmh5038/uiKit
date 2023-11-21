//
//  ViewModel.swift
//  TodoListUikit
//
//  Created by 김명현 on 11/19/23.
//

import Foundation

final class TodoData {
    static var shared = TodoData()
    
    private init() { }
    
     var dataList = [
        Todo(id: 1, title: "Grocery shopping", description: "Buy milk, eggs, bread, and cheese.", completed: false),
        Todo(id: 2, title: "iOS Project", description: "Work on the SwiftUI to-do list app", completed: false),
        Todo(id: 3, title: "Read SwiftUI Documentation", description: "Read the latest SwiftUI tutorials on Apple's developer website.", completed: false),
        Todo(id: 4, title: "Fitness", description: "Go for a 30-minute run in the park.", completed: true),
        Todo(id: 5, title: "Book Club", description: "Finish reading 'The Midnight Library' for the book club meeting.", completed: true),
        Todo(id: 6, title: "Laundry", description: "Wash and fold clothes for the upcoming week.", completed: true),
        Todo(id: 7, title: "Weekly Planning", description: "Plan out the work schedule for the next week, set goals and priorities.", completed: false),
        Todo(id: 8, title: "Gardening", description: "Plant new flower seeds in the garden and water the plants.", completed: false),
        Todo(id: 9, title: "Learn Guitar", description: "Have a catch-up call with mom and dad.", completed: true),
        Todo(id: 10, title: "Call Parents", description: "Have a catch-up call with mom and dad.", completed: true)
    ]
}
