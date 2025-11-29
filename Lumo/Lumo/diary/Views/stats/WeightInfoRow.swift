import SwiftUI

struct WeightInfoRow: View {
    @Binding var startWeight: Double
    @Binding var currentWeight: Double
    @Binding var goalWeight: Double
    
    var onEditTap: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            WeightCard(value: String(format: "%.0f", startWeight), label: "Начальный вес")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(String(format: "%.1f", currentWeight)) kg")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text("Текущий вес")
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.6))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(String(format: "%.0f", goalWeight)) kg")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                Text("Цель")
                    .font(.system(size: 11))
                    .foregroundColor(.black.opacity(0.6))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Кнопка карандаш
            Button(action: onEditTap) {
                Image(systemName: "pencil")
                    .foregroundColor(Color(red: 0.3, green: 0.6, blue: 0.3))
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(12)
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.8))
        .cornerRadius(16)
    }
}

struct WeightCard: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(value) kg")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            Text(label)
                .font(.system(size: 11))
                .foregroundColor(.black.opacity(0.6))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
