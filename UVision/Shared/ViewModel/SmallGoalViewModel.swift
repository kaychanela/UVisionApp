//
//  SmallGoalViewModel.swift
//  UVision
//
//  Created by Kayla Anderson on 12/10/23.
//


import Foundation

// View model for managing small goals
class SmallGoalViewModel: ObservableObject {
    
    // Published property to notify subscribers of changes in small goals
    @Published var goals: [SmallGoalItem] = []
    
    // Reference to the LargeGoalViewModel for managing large goals
    @Published var largeGoalViewModel: LargeGoalViewModel

    
    // Initializer with a reference to the LargeGoalViewModel
    init(largeGoalViewModel: LargeGoalViewModel) {
            self.largeGoalViewModel = largeGoalViewModel
            getGoals()
        }
    
    // Dummy data to initialize the list of small goals
    func getGoals() {
        let newGoals = [
            SmallGoalItem(title: "Finish Chapter", description: "read a whole chapter", isDone: false),
            SmallGoalItem(title: "Practice Spanish for 30 minutes", description: "practice speaking and listening", isDone: false)
        ]
        // Append the new small goals to the existing list
        goals.append(contentsOf: newGoals)
    }
    // Method to delete a small goal at a specified index
    func deleteGoal(indexSet: IndexSet) {
        goals.remove(atOffsets: indexSet)
    }
    // Method to move a small goal from one index to another
    func moveGoal(from: IndexSet, to: Int) {
        goals.move(fromOffsets: from, toOffset: to)
    }
    // Method to add a new small goal to the list
    func addGoal(title: String, description: String, largeGoal: LargeGoalItem?) {
        let newGoal = SmallGoalItem(title: title, description: description, isDone: false, largeGoal: largeGoal)
        // Append the new small goal to the list
        goals.append(newGoal)
    }
}
