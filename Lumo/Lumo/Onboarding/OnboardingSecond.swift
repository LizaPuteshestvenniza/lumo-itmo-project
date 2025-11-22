//
//  OnboardingSecond.swift
//  Lumo
//
//  Created by Lena Uvarovskaya on 22.11.2025.
//


import SwiftUI

struct OnboardingSecond: View {
    @Binding var page: Int

    @State private var name: String = ""
    @State private var selectedSex: String? = nil
    @State private var height: String = ""
    @State private var weight: String = ""
    
    @State private var nameError = false
    @State private var sexError = false
    @State private var heightError = false
    @State private var weightError = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            
            Text("Расскажите о себе")
                .font(.custom("Montserrat-SemiBold", size: 24))
            
            ZStack {
                if name.isEmpty {
                    Text("Ваше имя")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(Color(hex: "#585858"))
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    EmptyView()
                }
            
                TextField("", text: $name)
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(Color(hex: "#585858"))
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { _, _ in
                        nameError = false
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(nameError ? Color.red : Color.white, lineWidth: 2)
                            .frame(maxWidth: .infinity)
                            .frame(height: 41)
                    )
            }
            .frame(maxWidth: .infinity)
            .frame(height: 41)
            .background(Color(.white))
            .cornerRadius(20)
            .padding(.horizontal, 12)
        
            HStack(spacing: 12) {
                Text("Ваш пол")
                    .font(.custom("Montserrat-SemiBold", size: 16))
                    .foregroundColor(Color(hex: "#585858"))
                
                HStack(spacing: 12) {
                    
                    Button {
                        selectedSex = "Женский"
                        sexError = false
                    } label: {
                        Text("Женский")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .frame(maxWidth: .infinity)
                            .frame(height: 41)
                            .background(selectedSex == "Женский" ? Color(hex: "#CD70B9").opacity(0.2) : Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 999)
                                    .stroke(sexError ? Color.red : Color(hex: "#CD70B9"), lineWidth: 2)
                            )
                            .foregroundColor(Color(hex: "#585858"))
                            .cornerRadius(20)
                    }
                    
                    Button {
                        selectedSex = "Мужской"
                        sexError = false
                    } label: {
                        Text("Мужской")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .frame(maxWidth: .infinity)
                            .frame(height: 41)
                            .background(selectedSex == "Мужской" ? Color(hex: "#91C3E2").opacity(0.2) : Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 999)
                                    .stroke(sexError ? Color.red : Color(hex: "#91C3E2"), lineWidth: 2)
                            )
                            .foregroundColor(Color(hex: "#585858"))
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal, 12)
            
            HStack(spacing: 12) {
                
                ZStack {
                    if height.isEmpty {
                        Text("Рост")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(Color(hex: "#585858"))
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        EmptyView()
                    }
                    TextField("", text: $height)
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(Color(hex: "#585858"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .onChange(of: height) { _, newValue in
                            let filtered = newValue.filter(\.isNumber)
                            if filtered != height { height = filtered }
                            heightError = false
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(heightError ? Color.red : Color.white, lineWidth: 2)
                                .frame(maxWidth: .infinity)
                                .frame(height: 41)
                        )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 41)
                .background(Color(.white))
                .cornerRadius(20)
                
                
                ZStack {
                    if weight.isEmpty {
                        Text("Вес")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(Color(hex: "#585858"))
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        EmptyView()
                    }
                
                    TextField("", text: $weight)
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(Color(hex: "#585858"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .onChange(of: weight) { _, newValue in
                            let filtered = newValue.filter(\.isNumber)
                            if filtered != weight { weight = filtered }
                            weightError = false
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(weightError ? Color.red : Color.white, lineWidth: 2)
                                .frame(maxWidth: .infinity)
                                .frame(height: 41)
                        )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 41)
                .background(Color(.white))
                .cornerRadius(20)
            }
            .padding(.horizontal, 12)
            
            Spacer()
            
            Button {
                nameError = false
                sexError = false
                heightError = false
                weightError = false
                
                var isValid = true
                
                if name.isEmpty {
                    isValid = false
                    nameError = true
                }
                if selectedSex == nil {
                    isValid = false
                    sexError = true
                }
                if height.isEmpty || Int(height) == nil {
                    isValid = false
                    heightError = true
                }
                if weight.isEmpty || Int(weight) == nil {
                    isValid = false
                    weightError = true
                }
                
                if isValid {
                    page = 2
                }
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
            .padding(.vertical, 50)
        }
    }
}

#Preview {
    OnboardingMain()
}
