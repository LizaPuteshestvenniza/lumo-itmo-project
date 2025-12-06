//
//  LumoApp.swift
//  Lumo
//
//  Created by Лиза Плисюк on 17.11.2025.
//

import SwiftUI

@main
struct LumoApp: App {
    @AppStorage("hasFinishedOnboarding") private var hasFinishedOnboarding = false
    
    var body: some Scene {
        WindowGroup {
            if hasFinishedOnboarding {
                HomeView()              
            } else {
                OnboardingMain()
            }
        }
    }
}

