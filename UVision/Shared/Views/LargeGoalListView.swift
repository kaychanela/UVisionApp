//
//  LargeGoalListView.swift
//  UVision
//
//  Created by Kayla Anderson on 12/9/23.
//

import SwiftUI

struct LargeGoalListView: View {
    let goal: LargeGoalItem
    
    var body: some View {
        HStack{
            Image(systemName: goal.isDone ? "checkmark.circle" : "circle")
            Text(goal.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct LargeGoalListView_Previews: PreviewProvider {
    
    static var completedGoal = LargeGoalItem(title: "Example", description: "example", isDone: true, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
    static var incompletedGoal = LargeGoalItem(title: "Example", description: "example", isDone: false, compeltionDate: Date(), associatedColor: RGBColor(red: 0.5, green: 0.7, blue: 0.9))
    static var previews: some View {
        Group{
            LargeGoalListView(goal: completedGoal)
            LargeGoalListView(goal: incompletedGoal)
        }
    }
}
