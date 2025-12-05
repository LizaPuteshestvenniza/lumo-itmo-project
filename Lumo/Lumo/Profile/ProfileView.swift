//
//  ProfileView.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 27.11.2025.
//


import SwiftUI

struct ProfileView: View {

    @State private var name: String = "Анастасия"
    @State private var startWeight: Double = 60
    @State private var currentWeight: Double = 55.2
    @State private var targetWeight: Double = 45
    
    @State private var selectedTab: ProfileTab = .profile
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack() {
                    ProfileHeaderView(name: name)
                        .padding(.bottom, 8)
                    
                    ProfileGoalCardView(
                        startWeight: startWeight,
                        currentWeight: currentWeight,
                        targetWeight: targetWeight
                    )
                    .padding(.horizontal, 30)
                    
                    ProfileMenuSectionView()
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 24)
            }
            
            ProfileTabBarView(selectedTab: $selectedTab)
        }
        .background(Color(hex: "#F3F3F3").ignoresSafeArea())
    }
}

#Preview {
    ProfileView()
}
