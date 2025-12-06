//
//  StatsData.swift
//  Lumo
//
//  Created by Matvey Veselkov on 29.11.2025.
//
import Foundation

struct DailyNutrition: Identifiable {
    let id = UUID()
    let day: String
    let progress: Double
    let isMissed: Bool
    
    //Вес в этот день
    let weight: Double?
}


struct WeightPoint: Identifiable {
    let id = UUID()
    let date: Date
    let weight: Double
}

