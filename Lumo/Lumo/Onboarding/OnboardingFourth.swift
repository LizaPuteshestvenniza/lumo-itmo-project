//
//  OnboardingFourth.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 22.11.2025.
//


import SwiftUI

struct OnboardingFourth: View {
    @Binding var page: Int

    @State private var selectedActivity: ActivityType? = nil
    @State private var triedToContinue = false
    
    private func borderColor(for activity: ActivityType) -> Color {
        if selectedActivity == activity {
            return Color(hex: "#89C381")
        } else if selectedActivity == nil && triedToContinue {
            return Color.red
        } else {
            return Color(.white)
        }
    }

    enum ActivityType: String, CaseIterable, Identifiable {
        case low          = "Низкая"
        case daily        = "Бытовая активность"
        case workouts2_6  = "Тренировки 2–6 раз в неделю"
        case sportLife    = "Спорт – моя жизнь"

        var id: String { rawValue }

        var emoji: String {
            switch self {
            case .low:         return "🛋"
            case .daily:       return "🚶‍♀️"
            case .workouts2_6: return "🏋️‍♂️"
            case .sportLife:   return "🏅"
            }
        }

        var subtitle: String {
            switch self {
            case .low:
                return "Менее 5 тыс шагов в день и отсутствие \nтренировок"
            case .daily:
                return "Шаги до 10 000 – лёгкая активность, непостоянные тренировки"
            case .workouts2_6:
                return "Включает тренировки и шаги от 7 000 \nдо 15 000"
            case .sportLife:
                return "Очень активный образ жизни, шаги \n12 000+ и регулярные тренировки"
            }
        }
    }

    var body: some View {
        VStack {

            Spacer()

            Text("Какая у вас активность в течение дня?")
                .font(.custom("Montserrat-SemiBold", size: 24))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
            
            VStack(spacing: 16) {
                ForEach(ActivityType.allCases) { activity in
                    Button {
                        selectedActivity = activity
                        triedToContinue = false
                    } label: {
                        HStack(alignment: .top) {
                            Text(activity.emoji)
                                .font(.system(size: 32))
                                .padding(.horizontal, 8)

                            VStack(alignment: .leading) {
                                Text(activity.rawValue)
                                    .font(.custom("Montserrat-SemiBold", size: 16))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    

                                Text(activity.subtitle)
                                    .font(.custom("Montserrat-SemiBold", size: 12))
                                    .foregroundColor(Color(hex: "#585858"))
                                    .multilineTextAlignment(.leading)
                                    
                            }

                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity)
                        .frame(height: 86)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(borderColor(for: activity), lineWidth: 2.5)
                        )
                        .cornerRadius(22)
                    }
                }
            }
            .padding(.horizontal, 12)

            Spacer()

            Button {
                if selectedActivity == nil {
                    triedToContinue = true
                } else {
                    page = 4
                }
            } label: {
                Text("Дальше")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 22)
                    .padding()
                    .background(Color(hex: "#89C381"))
                    .foregroundColor(.white)
                    .cornerRadius(24)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 50)
        }
    }
}
#Preview {
    OnboardingMain()
}
