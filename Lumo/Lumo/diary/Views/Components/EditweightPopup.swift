//
//  EditweightPopup.swift
//  Lumo
//
//  Created by Matvey Veselkov on 29.11.2025.
//
import SwiftUI

struct EditWeightPopup: View {
    @Binding var weight: Double
    var onSave: () -> Void
    var onCancel: () -> Void
    
    var body: some View {
        ZStack {
            // Полупрозрачный темный фон
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture { onCancel() }
            
            // Само окошко
            VStack(spacing: 20) {
                // Заголовок и крестик
                HStack {
                    Text("Изменить текущий вес")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: onCancel) {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.gray)
                    }
                }
                
                // Поле ввода с кнопками +/-
                HStack(spacing: 15) {
                    // Кнопка Минус
                    Button(action: {
                        if weight > 0 { weight -= 0.1 }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 0.4, green: 0.8, blue: 0.5)) // Зеленый круг
                                .frame(width: 44, height: 44)
                            Image(systemName: "minus")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Цифра веса (поле)
                    // Используем TextField, чтобы можно было и руками ввести
                    TextField("0.0", value: $weight, format: .number.precision(.fractionLength(1)))
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                        .frame(width: 100)
                    
                    // Кнопка Плюс
                    Button(action: {
                        weight += 0.1
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 0.4, green: 0.8, blue: 0.5))
                                .frame(width: 44, height: 44)
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 0.4, green: 0.8, blue: 0.5), lineWidth: 1.5)
                )
                
                // Кнопка Готово
                Button(action: onSave) {
                    Text("Готово")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color(red: 0.4, green: 0.8, blue: 0.5)) // Зеленый фон
                        .cornerRadius(28)
                }
            }
            .padding(24)
            .background(Color.white)
            .cornerRadius(24)
            .padding(.horizontal, 20)
            .shadow(radius: 20)
        }
    }
}

