//
//  ProfileMenuSectionView.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 27.11.2025.
//



import SwiftUI

struct ProfileMenuSectionView: View {
    var body: some View {
        VStack(spacing: 0) {

            ProfileMenuRow(
                systemImage: "person.circle",
                title: "Мои данные",
                iconColor: Color(hex: "#89C381")
            ) {}

            Divider().padding(.horizontal, 12)

            ProfileMenuRow(
                systemImage: "gearshape",
                title: "Настройки",
                iconColor: Color(hex: "#89C381")
            ) {}

            Divider().padding(.horizontal, 12)

            ProfileMenuRow(
                systemImage: "rectangle.portrait.and.arrow.right",
                title: "Выход",
                iconColor: Color(hex: "#E45B5B")
            ) {}
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 10, y: 4)
        .padding(.horizontal, 30)
        .padding(.top, 10)
    }
}

private struct ProfileMenuRow: View {
    let systemImage: String
    let title: String
    let iconColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {

                Image(systemName: systemImage)
                    .font(.system(size: 16))
                    .foregroundColor(iconColor)

                Text(title)
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(.black)

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
        }
        .buttonStyle(.plain)
    }
}
