//
//  SmallGoalListView.swift
//  UVision
//
//  Created by Kayla Anderson on 12/10/23.
//

import SwiftUI

struct SmallGoalListView: View {
    let goal: SmallGoalItem
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: goal.isDone ? "checkmark.circle" : "circle")
                Text(goal.title)
                Spacer()
            }.font(.title2)
        
            Text(goal.largeGoal?.title ?? "No Category")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(.leading, -175.0)
        }.padding(.vertical, 8.0)
            
        
    }
}

struct SmallGoalListView_Previews: PreviewProvider {
    
    static var completedGoal = SmallGoalItem(title: "Example", description: "example", isDone: true)
    
    static var incompletedGoal = SmallGoalItem(title: "Example", description: "example", isDone: false)
    
    static var previews: some View {
        Group {
            SmallGoalListView(goal: completedGoal)
            SmallGoalListView(goal: incompletedGoal)
        }
    }
}
