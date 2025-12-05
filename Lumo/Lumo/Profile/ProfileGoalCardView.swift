//
//  ProfileGoalCardView.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 27.11.2025.
//


import SwiftUI

struct ProfileGoalCardView: View {
    let startWeight: Double
    let currentWeight: Double
    let targetWeight: Double

    private var remaining: Double {
        if startWeight > targetWeight {
            return max(currentWeight - targetWeight, 0)
        } else if startWeight < targetWeight {
            return max(targetWeight - currentWeight, 0)
        } else {
            return 0
        }
    }

    private var progress: Double {
        if startWeight > targetWeight {
            let totalToLose = startWeight - targetWeight
            guard totalToLose > 0 else { return 1 }

            let lost = startWeight - currentWeight
            let value = lost / totalToLose
            return min(max(value, 0), 1)

        } else if startWeight < targetWeight {
            let totalToGain = targetWeight - startWeight
            guard totalToGain > 0 else { return 1 }

            let gained = currentWeight - startWeight
            let value = gained / totalToGain
            return min(max(value, 0), 1)

        } else {
            return 1
        }
    }

    var body: some View {
        
        HStack(spacing: 8) {
            Image("ProfileFireIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)

            Text("До цели осталось всего")
                .font(.custom("Montserrat-SemiBold", size: 16))

            Text(String(format: "%.1f кг!", remaining))
                .font(.custom("Montserrat-SemiBold", size: 16))

            Spacer()
        }
        VStack(alignment: .leading, spacing: 12) {


            VStack(spacing: 12) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 999)
                            .fill(Color(hex: "#C5E7C0"))
                            .frame(height: 14)

                        RoundedRectangle(cornerRadius: 999)
                            .fill(Color(hex: "#79A872"))
                            .frame(
                                width: geo.size.width * progress,
                                height: 14
                            )
                            .animation(.easeInOut(duration: 0.3), value: progress)
                    }
                }
                .frame(height: 14)

                HStack {
                    Text("\(Int(startWeight)) кг")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(Color(hex: "#585858"))

                    Spacer()

                    Text("\(Int(targetWeight)) кг")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(Color(hex: "#585858"))
                }
            }

            Button {
                // экран изменения цели
            } label: {
                Text("Изменить цель")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(Color(hex: "#89C381"))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            }
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 10, y: 4)
    }
}
