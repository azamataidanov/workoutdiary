//
//  WorkoutRowView.swift
//  WorkoutDiary
//
//  Created by Михаил Щербаков on 30.08.2024.
//

import SwiftUI

struct WorkoutRowView: View {
    let workout: WorkoutData

    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.title)
                .font(.headline)
            
            Text("Rounds: \(workout.rounds) \(workout.rounds == 1 ? "round" : "rounds")")
            Text("Repeats: \(workout.repeats) \(workout.repeats == 1 ? "repeat" : "repeats")")
        }
        .padding(.vertical, 8)
    }
}

//#Preview {
//    WorkoutRowView()
//}
