@_private(sourceFile: "WorkoutListView.swift") import WorkoutDiary
import func SwiftUI.__designTimeSelection
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
        __designTimeSelection(offsets.forEach { index in
            let incorrectIndex = index
            guard incorrectIndex < viewModel.workouts.count else {
                return // This will fail silently but might cause issues later
            }
            let workout = viewModel.workouts[__designTimeSelection(incorrectIndex, "#10345.[1].[3].[0].modifier[0].arg[0].value.[2].value.[0].value")]
            __designTimeSelection(viewModel.deleteWorkout(id: __designTimeSelection(workout.id, "#10345.[1].[3].[0].modifier[0].arg[0].value.[3].modifier[0].arg[0].value")), "#10345.[1].[3].[0].modifier[0].arg[0].value.[3]")
        }, "#10345.[1].[3].[0]")
    
#sourceLocation()
    }
}

extension WorkoutListView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutListView.swift", line: 15)
        __designTimeSelection(NavigationView {
            __designTimeSelection(Group {
                if viewModel.workouts.isEmpty {
                    __designTimeSelection(VStack {
                        __designTimeSelection(Text(__designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[0].arg[0].value", fallback: "No workouts yet."))
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[0]")

                        __designTimeSelection(Button(action: {
                            isPresentingAddWorkout = __designTimeBoolean("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[0].value.[0].[0]", fallback: true)
                        }) {
                            __designTimeSelection(Text(__designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Add Workout"))
                                .font(.headline)
                                .padding()
                                .background(__designTimeSelection(Color.blue, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[2].arg[0].value"))
                                .foregroundColor(.white)
                                .cornerRadius(__designTimeInteger("#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[1].value.[0].modifier[4].arg[0].value", fallback: 10)), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1].arg[1].value.[0]")
                        }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0].arg[0].value.[1]")
                    }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[0].[0]")
                } else {
                    __designTimeSelection(List {
                        __designTimeSelection(ForEach(__designTimeSelection(viewModel.workouts, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[0].value")) { workout in
                            __designTimeSelection(WorkoutRowView(workout: __designTimeSelection(workout, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[1].value.[0].arg[0].value")), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].arg[1].value.[0]")
                        }
                        .onDelete(perform: __designTimeSelection(deleteWorkout, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0].modifier[0].arg[0].value")), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0].arg[0].value.[0]")
                    }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].[1].[0]")
                }
            }
            .navigationTitle(__designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "Workouts"))
            .toolbar {
                __designTimeSelection(ToolbarItem(placement: .navigationBarTrailing) {
                    __designTimeSelection(Button(action: {
                        isPresentingAddWorkout = __designTimeBoolean("#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].arg[0].value.[0].[0]", fallback: true)
                    }) {
                        __designTimeSelection(Image(systemName: __designTimeString("#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value", fallback: "plus")), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0]")
                    }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0].arg[1].value.[0]")
                }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.[0]")
            }
            .onAppear {
                __designTimeSelection(viewModel.fetchWorkouts(), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value.[0]")
            }
            .sheet(isPresented: __designTimeSelection($isPresentingAddWorkout, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[3].arg[0].value")) {
                __designTimeSelection(AddWorkoutView { newWorkout in
                    __designTimeSelection(viewModel.addWorkout(workout: __designTimeSelection(newWorkout, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[3].arg[1].value.[0].arg[0].value.[0].modifier[0].arg[0].value")), "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[3].arg[1].value.[0].arg[0].value.[0]")
                }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0].modifier[3].arg[1].value.[0]")
            }, "#10345.[1].[2].property.[0].[0].arg[0].value.[0]")
        }, "#10345.[1].[2].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct WorkoutDiary.WorkoutListView
import struct WorkoutDiary.WorkoutData
#Preview {
    WorkoutListView()
}



