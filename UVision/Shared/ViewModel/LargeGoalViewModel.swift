//
//  LargeGoalViewModel.swift
//  UVision
//
//  Created by Kayla Anderson on 12/9/23.
//

import Foundation

// View model for managing large goals
class LargeGoalViewModel: ObservableObject {
    
    // Published property to notify subscribers of changes in large goals
    @Published var goals: [LargeGoalItem] = []

    // Initializer to fetch goals when the view model is created
    init() {
        getGoals()
    }
    
    // Dummy data to initialize the list of goals
    func getGoals(){
        let newGoals = [
            LargeGoalItem(title: "Finish A Book", description: "read a whole book", isDone: false, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9)),
            LargeGoalItem(title: "Learn Spanish", description: "be fluent in spanish", isDone: false, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
        
        ]
        // Append the new goals to the existing list
        goals.append(contentsOf: newGoals)
    }
    
    // Method to delete a goal at a specified index
    func deleteGoal(indexSet: IndexSet){
        goals.remove(atOffsets: indexSet)
    }
    // Method to move a goal from one index to another
    func moveGoal(from: IndexSet, to: Int){
        goals.move(fromOffsets: from, toOffset: to)
    }
    // Method to add a new goal to the list
    func addGoal(title: String, description: String, completionDate: Date){
        let newGoal = LargeGoalItem(title: title, description: description, isDone: false, compeltionDate: completionDate, associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
        // Append the new goal to the list
        goals.append(newGoal)
    }
}



