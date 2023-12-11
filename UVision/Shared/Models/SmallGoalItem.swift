//
//  SmallGoalItem.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation
import SwiftUI

// SmallGoalItem structure conforming to Identifiable and Codable protocols
struct SmallGoalItem: Identifiable, Codable{
    
    // Unique identifier for each SmallGoalItem instance
    let id = UUID()
    // Properties representing the small goal information
    var title: String
    var description: String
    var isDone: Bool
    
    // Optional property representing the associated large goal
    var largeGoal: LargeGoalItem?

}
