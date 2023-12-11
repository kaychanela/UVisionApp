//
//  SmallGoalListView.swift
//  UVision
//
//  Created by Kayla Anderson on 12/10/23.
//

import SwiftUI

// View for displaying a small goal in a list
struct SmallGoalListView: View {
    let goal: SmallGoalItem
    
    var body: some View {
        VStack{
            HStack{
                // Display a checkmark circle if the goal is completed, otherwise display an empty circle
                Image(systemName: goal.isDone ? "checkmark.circle" : "circle")
                // Display the title of the small goal
                Text(goal.title)
                Spacer()
            }.font(.title2)
            // Display the title of the associated large goal, or "No Category" if there is none
            Text(goal.largeGoal?.title ?? "No Category")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.leading, -175.0)
        }.padding(.vertical, 8.0)
            
        
    }
}
// Preview provider for SmallGoalListView
struct SmallGoalListView_Previews: PreviewProvider {
    // Create completed and incompleted sample small goals for preview
    static var completedGoal = SmallGoalItem(title: "Example", description: "example", isDone: true)
    
    static var incompletedGoal = SmallGoalItem(title: "Example", description: "example", isDone: false)
    
    static var previews: some View {
        Group {
            // Preview the SmallGoalListView with completed and incompleted small goals
            SmallGoalListView(goal: completedGoal)
            SmallGoalListView(goal: incompletedGoal)
        }
    }
}
