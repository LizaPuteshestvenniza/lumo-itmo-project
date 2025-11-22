//
//  OnboardingFirth.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 23.11.2025.
//


import SwiftUI

struct OnboardingFifth: View {
    @Binding var page: Int
    
    @State private var isSyncEnabled = false

    var body: some View {
        VStack(spacing: 32) {
            
            Spacer()

            Text("Синхронизируйте отслеживание калорий и шагов с приложением Apple Health")
                .font(.custom("Montserrat-SemiBold", size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 12)

            Image("HealthIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
                .padding(.top, 20)

            Spacer()

            Button {
                isSyncEnabled.toggle()
            } label: {
                Text("Синхронизировать")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 22)
                    .padding()
                    .background(Color(hex: "#D1E9CE"))
                    .foregroundColor(Color(hex: "#5C8257"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "#89C381"), lineWidth: 2)
                    )
                    .cornerRadius(20)
            }
            .padding(.horizontal, 12)

            Button {
                page += 1
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
            .padding(.bottom, 50)
        }
        
    }
}

#Preview {
    OnboardingMain()
}
