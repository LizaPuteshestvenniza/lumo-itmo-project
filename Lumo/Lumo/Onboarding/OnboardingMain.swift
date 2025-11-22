//
//  OnboardingMain.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 22.11.2025.
//


import SwiftUI

struct OnboardingMain: View {
    @State private var page = 0

    var body: some View {
        ZStack{
            Color(hex: "#eeeeee")
                .ignoresSafeArea()
            
            TabView(selection: $page) {
                OnboardingFirst(page: $page)
                    .tag(0)
                
                OnboardingSecond(page: $page)
                    .tag(1)
                
                OnboardingThird(page: $page)
                    .tag(2)
                
                OnboardingFourth(page: $page)
                    .tag(3)
                
                OnboardingFifth(page: $page)
                    .tag(4)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

#Preview {
    OnboardingMain()
}
