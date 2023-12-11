//
//  Homepage.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation

import SwiftUI

// View for the homepage displaying current goals
struct HomepageView : View {
    
    // Access small and large goal view models from the environment
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
                // List to display small goals
                List {
                    ForEach(smallGoalViewModel.goals) { goal in
                        // Display each small goal using SmallGoalListView
                        SmallGoalListView(goal: goal)
                    }
                }.listStyle(.plain)
                
            }.navigationTitle("Welcome Back!")
        }
    }
    
}

// Preview provider for HomepageView
struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
        // Preview the HomepageView with environment objects for large and small goal view models
        
            .environmentObject(LargeGoalViewModel())
            .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))
    }
}
