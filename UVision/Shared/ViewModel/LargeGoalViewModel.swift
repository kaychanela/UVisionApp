//
//  LargeGoalViewModel.swift
//  UVision
//
//  Created by Kayla Anderson on 12/9/23.
//

import Foundation

class LargeGoalViewModel: ObservableObject {
    
    @Published var goals: [LargeGoalItem] = []

    init() {
        getGoals()
    }
    
    func getGoals(){
        let newGoals = [
            LargeGoalItem(title: "Finish A Book", description: "read a whole book", isDone: false, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9)),
            LargeGoalItem(title: "Learn Spanish", description: "be fluent in spanish", isDone: false, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
        
        ]
        goals.append(contentsOf: newGoals)
    }
    
    func deleteGoal(indexSet: IndexSet){
        goals.remove(atOffsets: indexSet)
    }
    func moveGoal(from: IndexSet, to: Int){
        goals.move(fromOffsets: from, toOffset: to)
    }
    
    func addGoal(title: String, description: String, completionDate: Date){
        let newGoal = LargeGoalItem(title: title, description: description, isDone: false, compeltionDate: completionDate, associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
        
        goals.append(newGoal)
    }
}



