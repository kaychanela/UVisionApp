//
//  UVisionApp.swift
//  Shared
//
//  Created by Kayla Anderson on 12/5/23.
//

import SwiftUI

@main
//UVision main
struct UVisionApp: App {
    // State object for managing large goal data
    @StateObject var largeGoalViewModel: LargeGoalViewModel = LargeGoalViewModel()
    // State object for managing small goal data, with a reference to the large goal view model
    @StateObject var smallGoalViewModel: SmallGoalViewModel = SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel())

    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Provide the LargeGoalViewModel as an environment object to ContentView
            .environmentObject(largeGoalViewModel)
            // Provide the SmallGoalViewModel as an environment object to ContentView
            .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))

        }
    }
}
