//
//  LargeGoalListView.swift
//  UVision
//
//  Created by Kayla Anderson on 12/9/23.
//

import SwiftUI

// View for displaying a large goal in a list
struct LargeGoalListView: View {
    let goal: LargeGoalItem
    
    var body: some View {
        HStack{
            // Display a checkmark circle if the goal is completed, otherwise display an empty circle
            Image(systemName: goal.isDone ? "checkmark.circle" : "circle")
            // Display the title of the goal
            Text(goal.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

// Preview provider for LargeGoalListView
struct LargeGoalListView_Previews: PreviewProvider {
    // Create completed and incompleted sample goals for preview
    static var completedGoal = LargeGoalItem(title: "Example", description: "example", isDone: true, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
    static var incompletedGoal = LargeGoalItem(title: "Example", description: "example", isDone: false, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
    static var previews: some View {
        Group{
            // Preview the LargeGoalListView with completed and incompleted goals
            LargeGoalListView(goal: completedGoal)
            LargeGoalListView(goal: incompletedGoal)
        }
    }
}
