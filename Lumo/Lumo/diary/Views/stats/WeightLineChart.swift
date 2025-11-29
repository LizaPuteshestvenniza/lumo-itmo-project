import SwiftUI
import Charts

struct WeightLineChart: View {
    let data: [WeightPoint]
    let weightInfoRow: WeightInfoRow
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Заголовок и кнопка меню
            HStack {
                Text("Изменение веса")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 0.05, green: 0.2, blue: 0.05))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(red: 0.2, green: 0.5, blue: 0.25))
                        .clipShape(Circle())
                }
            }
            
            // Сам график
            Chart {
                ForEach(data) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Weight", point.weight)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Color(red: 0.2, green: 0.5, blue: 0.25))
                    .lineStyle(StrokeStyle(lineWidth: 2))

                    // Точки
                    PointMark(
                        x: .value("Date", point.date),
                        y: .value("Weight", point.weight)
                    )
                    .foregroundStyle(.white)
                    .symbol {
                        Circle()
                            .stroke(Color(red: 0.2, green: 0.5, blue: 0.25), lineWidth: 2)
                            .fill(.white)
                            .frame(width: 10, height: 10)
                    }
                    .annotation(position: .top, alignment: .center, spacing: 10) {
                        Text("\(String(format: "%.0f", point.weight)) kg") // Например "60 kg"
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color(red: 0.2, green: 0.5, blue: 0.25)) // Темно-зеленый фон
                            )
                    }

                }
            }
            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
            // Масштабирование оси Y
            .chartYScale(domain: (data.map{$0.weight}.min() ?? 0) - 2 ... (data.map{$0.weight}.max() ?? 100) + 2)
            .frame(height: 160)
            .padding(.bottom, 10)

            weightInfoRow
        }
        .padding(20)
        // Зеленый фон с сеткой
        .background(
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.85, green: 0.95, blue: 0.88),
                        Color(red: 0.75, green: 0.9, blue: 0.8)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                GridPattern()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
            }
        )
        .cornerRadius(24)
        .shadow(color: Color.green.opacity(0.1), radius: 10, x: 0, y: 4)
    }
}

// Сетка для фона 
struct GridPattern: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let step: CGFloat = 30
        for x in stride(from: 0, to: rect.width, by: step) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
        }
        for y in stride(from: 0, to: rect.height, by: step) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: rect.width, y: y))
        }
        return path
    }
}
