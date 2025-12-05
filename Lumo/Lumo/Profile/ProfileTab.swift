//
//  ProfileTab.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 27.11.2025.
//


import SwiftUI

enum ProfileTab {
    case profile
    case home
    case stats
}

struct ProfileTabBarView: View {
    @Binding var selectedTab: ProfileTab
    
    var body: some View {
        HStack(spacing: 40) {
            tabItem(icon: "person.fill", tab: .profile)
            tabItem(icon: "house.fill", tab: .home)
            tabItem(icon: "chart.bar.fill", tab: .stats)
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 16)
        .background(
            Color(hex: "#F3F3F3")
                .ignoresSafeArea(edges: .bottom)
        )
    }
    private func tabItem(icon: String, tab: ProfileTab) -> some View {
        let isSelected = (selectedTab == tab)
        
        return Button {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                selectedTab = tab
            }
            
        } label: {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 68, height: 68)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(isSelected
                              ? Color(hex: "#79B56A")
                              : Color(hex: "#F4F4F4"))
                )
                .shadow(color: Color.black.opacity(isSelected ? 0.18 : 0.10),
                        radius: isSelected ? 9 : 6,
                        y: 4)
        }
        .buttonStyle(.plain)
    }
}
