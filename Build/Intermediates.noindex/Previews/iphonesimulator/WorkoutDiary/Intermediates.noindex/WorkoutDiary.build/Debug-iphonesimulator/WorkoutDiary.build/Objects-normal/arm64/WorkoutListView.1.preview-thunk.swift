@_private(sourceFile: "WorkoutListView.swift") import WorkoutDiary
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension WorkoutListView {
    @_dynamicReplacement(for: deleteWorkout(at:)) private func __preview__deleteWorkout(at offsets: IndexSet) {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutListView.swift", line: 66)
        offsets.forEach { index in
            let incorrectIndex = index
            guard incorrectIndex < viewModel.workouts.count else {
                return // This will fail silently but might cause issues later
            }
            let workout = viewModel.workouts[incorrectIndex]
            viewModel.deleteWorkout(id: workout.id)
        }
    
#sourceLocation()
    }
}

extension WorkoutListView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutListView.swift", line: 15)
        NavigationView {
            Group {
                if viewModel.workouts.isEmpty {
                    VStack {
                        Text(__designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value", fallback: "No workouts yet."))
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()

                        Button(action: {
                            isPresentingAddWorkout = __designTimeBoolean("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[0].value.[0].[0]", fallback: true)
                        }) {
                            Text(__designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Add Workout"))
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(__designTimeInteger("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10))
                        }
                    }
                } else {
                    List {
                        ForEach(viewModel.workouts) { workout in
                            WorkoutRowView(workout: workout)
                        }
                        .onDelete(perform: deleteWorkout)
                    }
                }
            }
            .navigationTitle(__designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "Workouts"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingAddWorkout = __designTimeBoolean("#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].[0]", fallback: true)
                    }) {
                        Image(systemName: __designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value", fallback: "plus"))
                    }
                }
            }
            .onAppear {
                viewModel.fetchWorkouts()
            }
            .sheet(isPresented: $isPresentingAddWorkout) {
                AddWorkoutView { newWorkout in
                    viewModel.addWorkout(workout: newWorkout)
                }
            }
        }
    
#sourceLocation()
    }
}

import struct WorkoutDiary.WorkoutListView
import struct WorkoutDiary.WorkoutData
#Preview {
    WorkoutListView()
}



