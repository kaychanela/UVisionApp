//
//  SmallGoalViewModel.swift
//  UVision
//
//  Created by Kayla Anderson on 12/10/23.
//


import Foundation

class SmallGoalViewModel: ObservableObject {
    
    @Published var goals: [SmallGoalItem] = []
    @Published var largeGoalViewModel: LargeGoalViewModel

    init(largeGoalViewModel: LargeGoalViewModel) {
            self.largeGoalViewModel = largeGoalViewModel
            getGoals()
        }
    
    func getGoals() {
        let newGoals = [
            SmallGoalItem(title: "Finish Chapter", description: "read a whole chapter", isDone: false),
            SmallGoalItem(title: "Practice Spanish for 30 minutes", description: "practice speaking and listening", isDone: false)
        ]
        
        goals.append(contentsOf: newGoals)
    }
    
    func deleteGoal(indexSet: IndexSet) {
        goals.remove(atOffsets: indexSet)
    }
    
    func moveGoal(from: IndexSet, to: Int) {
        goals.move(fromOffsets: from, toOffset: to)
    }
    
    func addGoal(title: String, description: String, largeGoal: LargeGoalItem?) {
        let newGoal = SmallGoalItem(title: title, description: description, isDone: false, largeGoal: largeGoal)
        goals.append(newGoal)
    }
}
