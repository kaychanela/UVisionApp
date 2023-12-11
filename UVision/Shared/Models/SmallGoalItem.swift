//
//  SmallGoalItem.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation
import SwiftUI

struct SmallGoalItem: Identifiable, Codable{
    let id = UUID()
    var title: String
    var description: String
    var isDone: Bool
    var largeGoal: LargeGoalItem?

}
