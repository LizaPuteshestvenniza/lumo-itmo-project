//
//  OnboardingThird.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 22.11.2025.
//


import SwiftUI

struct OnboardingThird: View {
    @Binding var page: Int

    @State private var selectedGoal: GoalType? = nil
    @State private var triedToContinue = false
    
    private func borderColor(for goal: GoalType) -> Color {
        if selectedGoal == goal {
            return Color(hex: "#89C381")
        } else if selectedGoal == nil && triedToContinue {
            return Color.red
        } else {
            return Color(.white)
        }
    }

    enum GoalType: String, CaseIterable, Identifiable {
        case loseWeight      = "Снизить вес"
        case gainMuscle      = "Набрать мышечную массу"
        case keepForm        = "Поддерживать форму"

        var id: String { rawValue }

        var emoji: String {
            switch self {
            case .loseWeight: return "🔥"
            case .gainMuscle: return "💪"
            case .keepForm:   return "⚖️"
            }
        }
    }

    var body: some View {
        VStack(spacing: 32) {

            Spacer()
            
            Text("Какая у вас цель?")
                .font(.custom("Montserrat-SemiBold", size: 24))
                .multilineTextAlignment(.center)

            VStack(spacing: 16) {
                ForEach(GoalType.allCases) { goal in
                    Button {
                        selectedGoal = goal
                        triedToContinue = false
                    } label: {
                        HStack(spacing: 16) {
                            Text(goal.emoji)
                                .font(.system(size: 24))

                            Text(goal.rawValue)
                                .font(.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(Color(.black))

                            Spacer()
                        }
                        .padding(.horizontal, 24)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(borderColor(for: goal), lineWidth: 2.5)
                        )
                        .cornerRadius(22)
                    }
                }
            }
            .padding(.horizontal, 12)

            Spacer()

            Button {
                if selectedGoal == nil {
                    triedToContinue = true
                } else {
                    page = 3
                }
            } label: {
                Text("Дальше")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 22)
                    .padding()
                    .background(Color(hex: "#89C381"))
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 50)
        }
        .background(Color(hex: "#F3F3F3").ignoresSafeArea())
    }
}

#Preview {
    OnboardingMain()
}
