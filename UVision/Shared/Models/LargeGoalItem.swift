//
//  LargeGoalItem.swift
//  UVision
//
//  Created by Kayla Anderson on 12/7/23.
//

import Foundation

import SwiftUI

struct RGBColor: Codable {
    var red: Double
    var green: Double
    var blue: Double
}

struct LargeGoalItem: Identifiable, Codable, Hashable{
    let id = UUID()
    var title: String
    var description: String
    var isDone: Bool
    var compeltionDate: Date = Date()
    var associatedColor: RGBColor
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

        static func == (lhs: LargeGoalItem, rhs: LargeGoalItem) -> Bool {
            return lhs.id == rhs.id
        }
}
