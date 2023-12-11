//
//  LargeGoalItem.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation

import SwiftUI

// RGBColor structure to represent colors with red, green, and blue components
struct RGBColor: Codable {
    var red: Double
    var green: Double
    var blue: Double
}

// LargeGoalItem structure conforming to Identifiable, Codable, and Hashable protocols
struct LargeGoalItem: Identifiable, Codable{
    
    // Unique identifier for each LargeGoalItem instance
    let id = UUID()
    // Properties representing the goal information
    var title: String
    var description: String
    var isDone: Bool
    var compeltionDate: Date = Date()
    var associatedColor: RGBColor
    
}
