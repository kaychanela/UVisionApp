//
//  UVisionApp.swift
//  Shared
//
//  Created by Kayla Anderson on 12/5/23.
//

import SwiftUI

@main
struct UVisionApp: App {
    @StateObject var largeGoalViewModel: LargeGoalViewModel = LargeGoalViewModel()
    @StateObject var smallGoalViewModel: SmallGoalViewModel = SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel())

    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(SmallGoalViewModel(largeGoalViewModel: LargeGoalViewModel()))
            .environmentObject(largeGoalViewModel)
        }
    }
}
