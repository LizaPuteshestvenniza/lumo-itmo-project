import SwiftUI

struct NutritionBarChart: View {
    let data: [DailyNutrition]
    @State private var selectedBar: DailyNutrition?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Статистика соблюдения питания")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(red: 0.05, green: 0.2, blue: 0.05))
            
            GeometryReader { geometry in
                HStack(alignment: .bottom, spacing: 8) {
                    ForEach(data) { item in
                        // Вызываем отдельную функцию для построения столбика
                        barItemView(item: item, totalHeight: geometry.size.height)
                    }
                }
            }
            .frame(height: 220)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 4)
    }
    
    @ViewBuilder
    private func barItemView(item: DailyNutrition, totalHeight: CGFloat) -> some View {
        VStack(spacing: 6) {
            // 1. Окошко
            if selectedBar?.id == item.id {
                infoPopup(for: item)
            }
            
            // 2. Столбик
            ZStack(alignment: .bottom) {
                // Фон
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: totalHeight - 40)
                
                // Прогресс
                RoundedRectangle(cornerRadius: 8)
                    .fill(item.progress < 0.2 ? Color.red.opacity(0.6) : Color(red: 0.3, green: 0.8, blue: 0.5))
                    .frame(height: (totalHeight - 40) * item.progress)
            }
            .frame(maxWidth: .infinity)
            .onTapGesture {
                withAnimation(.spring(response: 0.3)) {
                    selectedBar = (selectedBar?.id == item.id) ? nil : item
                }
            }
            
            // 3. День
            Text(item.day)
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .frame(height: 14)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    // Отдельная функция для окошка
    @ViewBuilder
    private func infoPopup(for item: DailyNutrition) -> some View {
        VStack(spacing: 2) {
            Text("\(String(format: "%.1f", item.weight ?? 0.0)) кг")
                .font(.system(size: 10))
                .foregroundColor(.gray)
                .fixedSize() //Запрещает обрезать текст 
            
            Text("\(Int(item.progress * 100))%")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .fixedSize()
        }
        .padding(8)
        .frame(minWidth: 40)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
        )
        .transition(.scale.combined(with: .opacity))
        .zIndex(10)
    }
}
