//
//  CardBackground.swift
//  Lumo
//
//  Created by Matvey Veselkov on 29.11.2025.
//
import SwiftUI

// Общий фон для карточек (Зеленый градиент + блик)
struct CardBackground: View {
    var body: some View {
        ZStack {
            // 1. Основной градиент (Мятный -> Темно-изумрудный)
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.4, green: 0.85, blue: 0.6),  // Мятный
                    Color(red: 0.25, green: 0.65, blue: 0.45) // Темнее
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // 2. Блик свечения (для объема)
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.35),
                    Color.white.opacity(0.05),
                    Color.clear
                ]),
                center: .center,
                startRadius: 10,
                endRadius: 200
            )
            .blendMode(.overlay)
        }
        .cornerRadius(24)
        .shadow(color: Color.green.opacity(0.2), radius: 12, x: 0, y: 6)
    }
}

