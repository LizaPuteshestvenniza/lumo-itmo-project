//
//  ProfileHeaderView.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 27.11.2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    let name: String
    
    var body: some View {
        ZStack {
            Spacer()
            Image("ProfileTop")
                .resizable()
                .scaledToFill()
                .frame(width: 400)
                .allowsHitTesting(false)
            
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    
                    Image("ProfileAvatarPlaceholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color(hex: "#3A7731"), lineWidth: 3)
                        )
                    
                    Button {
                        //экран выбора фото
                    } label: {
                        Image("ProfileEditPhotoButton")
                            .resizable()
                            .frame(width: 40, height: 38)
                    }
                    .offset(x: -5, y: -4)
                }
                Text(name)
                    .font(.custom("Montserrat-SemiBold", size: 24))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .offset(y: 30)
        }
        .frame(height: 300)
        .padding(.horizontal, 20)
    }
}
