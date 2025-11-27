//
//  OnboardingFirst.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 22.11.2025.
//


import SwiftUI

struct OnboardingFirst: View {
    @Binding var page: Int

    var body: some View {
        ZStack{
            VStack(spacing: 32) {
                
                Spacer()
                
                Text("Приветствуем в Lumo!")
                    .font(.custom("Montserrat-SemiBold", size: 24))
                
                Image("OnboardingLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 176)
                
                Text("Давайте познакомимся поближе")
                    .font(.custom("Montserrat-SemiBold", size: 24))
                    .foregroundColor(Color(hex: "#585858"))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    page = 1
                } label: {
                    Text("Начать")
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
        }
    }
}
#Preview {
    OnboardingMain()
}
