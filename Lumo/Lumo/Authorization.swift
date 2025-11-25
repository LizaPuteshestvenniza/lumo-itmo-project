//
//  Authorization.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 18.11.2025.
//

import SwiftUI
import AuthenticationServices

struct Authorization: View {
    @State private var showBottomSheet = false
    @State private var appleUserId: String? = nil

    var body: some View {
        ZStack {
            VStack(spacing: 24){
                Spacer().frame(height: 10)
                
                Image(showBottomSheet ? "AuthLogoLight" : "AuthLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 197, height: 199)
                    .animation(.none, value: showBottomSheet)
                
                Spacer().frame(height: 10)
                
                Button(
                    action:{
                        showBottomSheet = true
                    },
                    label: {
                        Image("AuthButtonAuthorize")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 318, height: 66)
                        
                    }
                )
                
                Button(
                    action:{
                        showBottomSheet = true
                    },
                    label: {
                        Image("AuthButtonRegister")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 318, height: 66)
                        
                    }
                )
                Spacer()
            }
            if showBottomSheet {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showBottomSheet = false
                    }

                VStack {
                    Spacer()

                    VStack(spacing: 16) {
                        Text("Войти")
                            .font(.title2.bold())

                        SignInWithAppleButton(
                            .signIn,
                             onRequest: { request in
                                 request.requestedScopes = [.fullName, .email]
                             },
                             onCompletion: { result in
                                 switch result {
                                 case .success(let authorization):
                                     if let credential = authorization.credential
                                         as? ASAuthorizationAppleIDCredential {

                                         let userId = credential.user
                                         appleUserId = userId
                                         showBottomSheet = false
                                     }
                                 case .failure(let error):
                                     print("Apple sign in error:", error.localizedDescription)
                                 }
                             }
                       )
                       .signInWithAppleButtonStyle(.black)
                       .frame(height: 56)
                       .clipShape(RoundedRectangle(cornerRadius: 18))
                   }
                   .padding(.horizontal, 24)
                   .padding(.top, 24)
                   .padding(.bottom, 40)
                   .frame(maxWidth: .infinity)
                   .background(Color.white.opacity(0.7))
                   .ignoresSafeArea(edges: .bottom)
               }
               .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: showBottomSheet)
    }
}

#Preview {
    Authorization()
}
