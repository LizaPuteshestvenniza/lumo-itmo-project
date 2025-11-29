import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            // 1. Профиль
            Button(action: { selectedTab = 0 }) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == 0 ? .black : .gray)
                    .frame(maxWidth: .infinity)
            }
            
            // 2. Домик (Главная)
            Button(action: { selectedTab = 1 }) {
                Image(systemName: "house.fill")
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == 1 ? .black : .gray)
                    .frame(maxWidth: .infinity)
            }
            
            // 3. Статистика
            Button(action: { selectedTab = 2 }) {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == 2 ? Color(red: 0.2, green: 0.8, blue: 0.4) : .gray) // Зеленый активный
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.top, 14) // Отступ сверху
        //Отступ снизу для Safe Area, чтобы иконки не перекрывались полоской
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 34)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: -5)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomTabBarModern: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                TabBarButton(icon: "person.circle.fill", index: 0, selection: $selectedTab)
                TabBarButton(icon: "house.fill", index: 1, selection: $selectedTab)
                TabBarButton(icon: "chart.bar.fill", index: 2, selection: $selectedTab)
            }
            .padding(.top, 14)
            .padding(.bottom, 0)
        }
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
    }
}

struct TabBarButton: View {
    let icon: String
    let index: Int
    @Binding var selection: Int
    
    var body: some View {
        Button(action: { selection = index }) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(selection == index ? (index == 2 ? Color.green : .black) : .gray)
                .frame(maxWidth: .infinity)
        }
    }
}

