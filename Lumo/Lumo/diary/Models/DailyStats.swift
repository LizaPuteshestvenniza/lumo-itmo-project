//
//  DailyStats.swift
//  Lumo
//
//  Created by Matvey Veselkov on 22.11.2025.
//
import Foundation

struct DailyStats {
    var consumed: Int
    var burned: Int
    var goal: Int
    
    // Добавляем БЖУ
    var protein: Int = 0
    var fat: Int = 0
    var carbs: Int = 0
    
    // Цели по БЖУ (можно сделать настраиваемыми)
    let proteinGoal = 110
    let fatGoal = 55
    let carbsGoal = 230
    
    var remaining: Int {
        goal - consumed + burned
    }
    
    var progress: Double {
        guard goal > 0 else { return 0 }
        return min(Double(consumed) / Double(goal), 1.0)
    }
}
