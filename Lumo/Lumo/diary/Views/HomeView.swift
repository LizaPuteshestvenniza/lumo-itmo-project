import SwiftUI

struct HomeView: View {
    @State private var selectedTab: ProfileTab = .home
    @State private var dailyStats = DailyStats(consumed: 500, burned: 250, goal: 1950)
    
    // Состояние для открытия экрана добавления воды
    @State private var showAddWater = false
    
    @State private var currentWaterAmount: Double = 1250
    
    @State private var waterHistory: [Int] = [300, 200]
    
    @State private var showAddMeal = false
    @State private var selectedMealIndex: Int = 0
    
    @State private var meals: [MealData] = [
        MealData(name: "Завтрак", calories: 500, protein: 25, fat: 20, carbs: 55),
        MealData(name: "Обед", calories: 0, protein: 0, fat: 0, carbs: 0),
        MealData(name: "Ужин", calories: 0, protein: 0, fat: 0, carbs: 0),
        MealData(name: "Перекус", calories: 0, protein: 0, fat: 0, carbs: 0)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                switch selectedTab {
                case .profile:
                    ProfileView() // экран профиля (или как он у вас называется)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(UIColor.systemGroupedBackground))

                case .home:
                    ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 16) {
                                                
                                                // Приветствие
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("Привет, Айлин!")
                                                        .font(.system(size: 28, weight: .bold))
                                                        .foregroundColor(.primary)
                                                    Text("Вы молодец, продолжайте в том же духе!")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(.secondary)
                                                }
                                                .padding(.horizontal, 16)
                                                .padding(.top, 8)
                                                
                                                // Карточка Калорий
                                                CalorieRingView(dailyStats: dailyStats)
                                                    .padding(.horizontal, 16)
                                                
                                                // Карточка Воды
                                                WaterIntakeCard(
                                                    current: currentWaterAmount,
                                                    goal: 2200,
                                                    onAddTap: { showAddWater = true }
                                                )
                                                .padding(.horizontal, 16)
                                                
                                                // Список Еды
                                                VStack(spacing: 0) {
                                                                ForEach(Array(meals.enumerated()), id: \.element.id) { index, meal in
                                                                    MealRow(
                                                                        meal: meal,
                                                                        onAddTap: {
                                                                            selectedMealIndex = index
                                                                            showAddMeal = true
                                                                        },
                                                                        isLast: index == meals.count - 1
                                                                    )
                                                                }
                                                            }
                                                .padding(.vertical, 4)
                                                .background(
                                                    ZStack {
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [
                                                                Color(red: 0.4, green: 0.85, blue: 0.6),
                                                                Color(red: 0.25, green: 0.65, blue: 0.45)
                                                            ]),
                                                            startPoint: .topLeading,
                                                            endPoint: .bottomTrailing
                                                        )
                                                        RadialGradient(
                                                            gradient: Gradient(colors: [
                                                                Color.white.opacity(0.35),
                                                                Color.white.opacity(0.05),
                                                                Color.clear
                                                            ]),
                                                            center: .center,
                                                            startRadius: 10,
                                                            endRadius: 200
                                                        )
                                                        .blendMode(.overlay)
                                                    }
                                                )
                                                .cornerRadius(24)
                                                .shadow(color: Color.green.opacity(0.2), radius: 12, x: 0, y: 6)
                                                .padding(.horizontal, 16)
                                                .padding(.bottom, 100)
                            }
                                    .padding(.top, 1)
                                    .padding(.bottom, 80) // добавили нижний отступ под таббар
                                }

                case .stats:
                    StatsView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(UIColor.systemGroupedBackground))
                }
            }
            .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
                    
            VStack(spacing: 0) {
                        Spacer()
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 100)          // высота белой полосы
                            .ignoresSafeArea(edges: .bottom)
                    }

                    // САМ ТАББАР
                    ProfileTabBarView(selectedTab: $selectedTab)

            
            ProfileTabBarView(selectedTab: $selectedTab)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $showAddWater) {
            AddWaterView(
                history: $waterHistory,
                currentWater: $currentWaterAmount //
            )
        }
        
        .sheet(isPresented: $showAddMeal) {
            AddMealView { newMealData in
                // 1. Обновляем список еды
                meals[selectedMealIndex].calories += newMealData.calories
                meals[selectedMealIndex].protein += newMealData.protein
                meals[selectedMealIndex].fat += newMealData.fat
                meals[selectedMealIndex].carbs += newMealData.carbs
                
                // 2. ОБНОВЛЯЕМ ОБЩУЮ СТАТИСТИКУ (БЖУ)
                dailyStats.consumed += newMealData.calories
                dailyStats.protein += newMealData.protein
                dailyStats.fat += newMealData.fat
                dailyStats.carbs += newMealData.carbs
            }
        }

            }
        }

