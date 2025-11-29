import SwiftUI

struct AddWaterView: View {
    @Environment(\.dismiss) var dismiss
    
    // Используем Binding, чтобы обновлять массив в HomeView
    @Binding var history: [Int]
    
    // Колбэк для обновления счетчика в HomeView
    @Binding var currentWater: Double
    
    // Локальное состояние для ввода числа
    @State private var waterAmount: Int = 350
    
    var body: some View {
        VStack(spacing: 0) {
            // 1. ВЕРХНЯЯ ПАНЕЛЬ
            HStack {
                Button(action: { dismiss() }) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .medium))
                        Text("Питьевой режим")
                            .font(.system(size: 24, weight: .bold))
                    }
                    .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    // ЗАГОЛОВОК
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Добавить воду")
                            .font(.system(size: 20, weight: .bold))
                        Text("Объем, мл")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20)
                    
                    // 2. ПОЛЕ ВВОДА
                    HStack {
                        Button(action: { if waterAmount >= 50 { waterAmount -= 50 } }) {
                            Circle()
                                .fill(Color(red: 0.4, green: 0.8, blue: 1.0))
                                .frame(width: 44, height: 44)
                                .overlay(Image(systemName: "minus").font(.system(size: 24, weight: .medium)).foregroundColor(.white))
                        }
                        
                        Spacer()
                        
                        Text("\(waterAmount)")
                            .font(.system(size: 28, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: { waterAmount += 50 }) {
                            Circle()
                                .fill(Color(red: 0.4, green: 0.8, blue: 1.0))
                                .frame(width: 44, height: 44)
                                .overlay(Image(systemName: "plus").font(.system(size: 24, weight: .medium)).foregroundColor(.white))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    
                    // 3. БЫСТРЫЕ КНОПКИ
                    HStack(spacing: 12) {
                        QuickWaterButton(label: "+50 мл") { waterAmount += 50 }
                        QuickWaterButton(label: "+100 мл") { waterAmount += 100 }
                        QuickWaterButton(label: "+200 мл") { waterAmount += 200 }
                    }
                    .padding(.horizontal, 20)
                    
                    // 4. СПИСОК "ДОБАВЛЕНО"
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Добавлено")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.horizontal, 20)
                        
                        if history.isEmpty {
                            Text("История пуста")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 20)
                        } else {
                            VStack(spacing: 12) {
                                ForEach(history, id: \.self) { amount in
                                    HStack {
                                        Image(systemName: "cup.and.saucer.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(Color(red: 0.4, green: 0.8, blue: 1.0))
                                            .frame(width: 30)
                                        
                                        Text("\(amount) мл")
                                            .font(.system(size: 17, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray.opacity(0.5))
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(16)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
            
            Spacer()
            
            // 5. КНОПКА "ДОБАВИТЬ"
            Button(action: {
                        // 1. История
                        history.insert(waterAmount, at: 0)
                        
                        // 2. Обновляем воду через Binding
                        currentWater += Double(waterAmount)
                        
                    }) {
                Text("Добавить")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color(red: 0.4, green: 0.8, blue: 1.0))
                    .cornerRadius(28)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationBarHidden(true)
    }
}

// Вспомогательная кнопка
struct QuickWaterButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color.white)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(red: 0.4, green: 0.8, blue: 1.0), lineWidth: 1.5)
                )
        }
    }
}

#Preview {
    AddWaterView(
        history: .constant([300]),
        currentWater: .constant(1250)
    )
}
