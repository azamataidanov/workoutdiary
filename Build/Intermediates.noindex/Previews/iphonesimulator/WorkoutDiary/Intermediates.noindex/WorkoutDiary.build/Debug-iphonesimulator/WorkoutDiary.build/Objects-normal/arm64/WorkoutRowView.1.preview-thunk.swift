@_private(sourceFile: "WorkoutRowView.swift") import WorkoutDiary
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension WorkoutRowView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutRowView.swift", line: 14)
        VStack(alignment: .leading) {
            Text(workout.title)
                .font(.headline)
            
            Text("Rounds: \(workout.rounds != __designTimeInteger("#12653.[1].[1].property.[0].[0].arg[1].value.[1].arg[0].value.[1].value.arg[0].value.if.[0]", fallback: 0) ? workout.rounds : __designTimeInteger("#12653.[1].[1].property.[0].[0].arg[1].value.[1].arg[0].value.[1].value.arg[0].value.else", fallback: 0)) rounds")
            Text("Repeats: \(workout.repeats)")
        }
        .padding(.vertical, __designTimeInteger("#12653.[1].[1].property.[0].[0].modifier[0].arg[1].value", fallback: 8))
    
#sourceLocation()
    }
}

import struct WorkoutDiary.WorkoutRowView

