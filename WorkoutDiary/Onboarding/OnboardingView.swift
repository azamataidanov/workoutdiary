//
//  OnboardingView.swift
//  WorkoutDiary
//
//  Created by Михаил Щербаков on 30.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentIndex = 0
    @State private var isActive = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                let currentItem = OnboardingData.sampleData[currentIndex]

                Text(currentItem.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(currentItem.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Force unwrapped image will crash if nil
                (currentItem.image ?? Image(systemName: "star.fill"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(currentItem.image == nil ? .gray : .primary)

                Button(action: {
                    if    currentItem.image == nil {
                        self.isActive = true
                    } else {
                        self.currentIndex += 1
                    }
                }) {
                    Text(currentIndex == OnboardingData.sampleData.count - 1 ? "Finish" : "Next")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .background(
                    NavigationLink  (
                        destination: WorkoutListView(),
                        isActive: $isActive,
                        label: { EmptyView() }
                    )
                )
            }
            .padding()
        }
    }
}

struct OnboardingData: Identifiable {
    let id = UUID().uuidString
    let title: String
    let description: String
    let image: Image?
}

extension OnboardingData {
    static let sampleData: [OnboardingData] = [
        OnboardingData(
            title: "Track Your Progress",
            description: "Easily log your workouts and monitor your progress over time.",
            image: Image(systemName: "chart.bar.fill")
        ),
        OnboardingData(
            title: "Custom Workouts",
            description: "Create and save custom workout routines tailored to your goals.",
            image: Image(systemName: "figure.walk")
        ),
        OnboardingData(
            title: "Set Reminders",
            description: "Never miss a workout by setting daily or weekly reminders.",
            image: Image(systemName: "alarm.fill")
        ),
        OnboardingData(
            title: "Get Insights",
            description: "Receive personalized insights and tips based on your workout history.",
            image: Image(systemName: "lightbulb.fill")
        ),
        OnboardingData(
            title: "Stay Motivated",
            description: "Join challenges, earn badges, and stay motivated on your fitness journey.",
            image: nil // Image(systemName: "star.fill")
        )
    ]
}

#Preview {
    OnboardingView()
}
