import SwiftUI

struct StatsView: View {
    @State private var nutritionData: [DailyNutrition] = [
        .init(day: "Пн", progress: 0.7, isMissed: false, weight: 60.5),
        .init(day: "Вт", progress: 0.1, isMissed: true, weight: 60.2),
        .init(day: "Ср", progress: 0.85, isMissed: false, weight: 59.8),
        .init(day: "Чт", progress: 0.75, isMissed: false, weight: 59.5),
        .init(day: "Пт", progress: 1.0, isMissed: false, weight: 59.0),
        .init(day: "Сб", progress: 1.0, isMissed: false, weight: 58.8),
        .init(day: "Вс", progress: 1.0, isMissed: false, weight: 58.5)
    ]
    
    @State private var weightData: [WeightPoint] = [
        .init(date: Date().addingTimeInterval(-86400 * 6), weight: 60.0),
        .init(date: Date().addingTimeInterval(-86400 * 4), weight: 58.0),
        .init(date: Date().addingTimeInterval(-86400 * 2), weight: 56.5),
        .init(date: Date(), weight: 55.2)
    ]
    
    // Переменные веса
    @State private var startWeight: Double = 60.0
    @State private var currentWeight: Double = 55.2
    @State private var goalWeight: Double = 45.0
    
    // Состояние для показа попапа
    @State private var showEditPopup = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Прогресс")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    
                    NutritionBarChart(data: nutritionData)
                        .padding(.horizontal, 20)
                    
                    WeightLineChart(
                        data: weightData,
                        weightInfoRow: WeightInfoRow(
                            startWeight: $startWeight,
                            currentWeight: $currentWeight,
                            goalWeight: $goalWeight,
                            onEditTap: { showEditPopup = true }
                        )
                    )
                    .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 100)
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            
            if showEditPopup {
                EditWeightPopup(
                    weight: $currentWeight, // Привязываем к текущему весу
                    onSave: {
                        updateChartData() // Обновляем график
                        showEditPopup = false // Закрываем
                    },
                    onCancel: {
                        showEditPopup = false
                    }
                )
                .transition(.opacity) // Плавное появление
                .zIndex(100)
            }
        }
    }
    
    func updateChartData() {
        if !weightData.isEmpty {
            let lastIndex = weightData.count - 1
            let newPoint = WeightPoint(date: Date(), weight: currentWeight)
            weightData[lastIndex] = newPoint
        } else {
            weightData.append(WeightPoint(date: Date(), weight: currentWeight))
        }
    }
}
