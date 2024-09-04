//
//  WorkoutListView.swift
//  WorkoutDiary
//
//  Created by Михаил Щербаков on 30.08.2024.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject private var viewModel = WorkoutViewModel()
    @State private var isPresentingAddWorkout = false
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.workouts.isEmpty {
                    VStack {
                        Text("No workouts yet.")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()
                        
                        Button(action: {
                            isPresentingAddWorkout = true
                        }) {
                            Text("Add Workout")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
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
            .navigationTitle("Workouts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingAddWorkout = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.fetchWorkouts()
            }
            .sheet(isPresented: $isPresentingAddWorkout) {
                AddWorkoutView(onSave: { WorkoutData in
                    viewModel.addWorkout(workout: WorkoutData)
                }, existingWorkouts: viewModel.workouts)
            }
        }
    }
       private func deleteWorkout(at offsets: IndexSet) {
            offsets.forEach { index in
                guard index < viewModel.workouts.count else {
                    return // Safeguard against out-of-bounds index
                }
                let workout = viewModel.workouts[index]
                viewModel.deleteWorkout(id: workout.id)
            }
        }
    }

    struct WorkoutData: Identifiable {
        let id: UUID
        let title: String
        let rounds: Int
        let repeats: Int
    }
    
    #Preview {
        WorkoutListView()
    }
