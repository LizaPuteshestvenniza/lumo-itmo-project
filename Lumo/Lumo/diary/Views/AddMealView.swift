//
//  AddMealView.swift
//  Lumo
//
//  Created by Matvey Veselkov on 29.11.2025.
//
import SwiftUI

struct AddMealView: View {
    @Environment(\.dismiss) var dismiss
    
    // Колбэк для передачи новой еды в HomeView
    var onAdd: (MealData) -> Void
    
    // Поля ввода
    @State private var name: String = ""
    @State private var calories: String = ""
    @State private var protein: String = ""
    @State private var fat: String = ""
    @State private var carbs: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Добавить прием пищи")
                    .font(.system(size: 22, weight: .bold))
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray.opacity(0.5))
                }
            }
            .padding(20)
            
            ScrollView {
                VStack(spacing: 20) {
                    // ГРУППА 1: НАЗВАНИЕ
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Название")
                            .font(.headline)
                            .foregroundColor(.gray)
                        TextField("Например: Яблоко", text: $name)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                    }
                    .padding(.horizontal, 20)
                    
                    // ГРУППА 2: КАЛОРИИ
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Калории (ккал)")
                            .font(.headline)
                            .foregroundColor(.gray)
                        TextField("0", text: $calories)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                    }
                    .padding(.horizontal, 20)
                    
                    // ГРУППА 3: БЖУ (В ряд)
                    HStack(spacing: 15) {
                        NutrientInput(title: "Белки", text: $protein, color: .green)
                        NutrientInput(title: "Жиры", text: $fat, color: .orange)
                        NutrientInput(title: "Углеводы", text: $carbs, color: .blue)
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            Spacer()
            
            // КНОПКА "ДОБАВИТЬ"
            Button(action: {
                // Конвертируем строки в числа
                let newMeal = MealData(
                    name: name.isEmpty ? "Новая еда" : name,
                    calories: Int(calories) ?? 0,
                    protein: Int(protein) ?? 0,
                    fat: Int(fat) ?? 0,
                    carbs: Int(carbs) ?? 0
                )
                
                // Отправляем в HomeView
                onAdd(newMeal)
                dismiss()
            }) {
                Text("Добавить")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        name.isEmpty || calories.isEmpty
                        ? Color.gray.opacity(0.5)
                        : Color(red: 0.4, green: 0.85, blue: 0.6) // Тот самый зеленый
                    )
                    .cornerRadius(28)
            }
            .disabled(name.isEmpty || calories.isEmpty)
            .padding(20)
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
}

// Вспомогательный компонент для поля ввода БЖУ
struct NutrientInput: View {
    let title: String
    @Binding var text: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(color)
            
            TextField("0", text: $text)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .padding(.vertical, 12)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
        }
    }
}

#Preview {
    AddMealView(onAdd: { _ in })
}

