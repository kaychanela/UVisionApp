//
//  Homepage.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation

import SwiftUI

struct HomepageView : View {
    
    @EnvironmentObject var smallGoalViewModel: SmallGoalViewModel
    @EnvironmentObject var largeGoalViewModel: LargeGoalViewModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Text("Here Are Your Current Goals!")
                    .font(.headline)
                    .foregroundColor(Color("AccentColor"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 50.0)
                List {
                    ForEach(smallGoalViewModel.goals) { goal in
                        SmallGoalListView(goal: goal)
                    }
                    .onDelete(perform: smallGoalViewModel.deleteGoal)
                    .onMove(perform: smallGoalViewModel.moveGoal)
                }.listStyle(.plain)
                
            }.navigationTitle("Welcome Back!")
        }
    }
    
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
            HomepageView()
        .environmentObject(LargeGoalViewModel())
        .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))
    }
}
