//
//  WorkoutViewModel.swift
//  WorkoutDiary
//
//  Created by Михаил Щербаков on 30.08.2024.
//

import Foundation
import Combine

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [WorkoutData] = []
    private var cancellables = Set<AnyCancellable>()
    
    private let fetchWorkoutsSubject = PassthroughSubject<Void, Never>()
    private let deleteWorkoutSubject = PassthroughSubject<UUID, Never>()
    private let addWorkoutSubject = PassthroughSubject<WorkoutData, Never>()
    
    init() {
        bindInputs()
    }
    
    private func bindInputs() {
        fetchWorkoutsSubject
            .map { CoreDataHandler.shared.fetchWorkouts() }
            .sink { [weak self] fetchedWorkouts in
                self?.workouts = fetchedWorkouts
            }
            .store(in: &cancellables)
        
        deleteWorkoutSubject
            .sink { id in
                CoreDataHandler.shared.deleteWorkout(withID: id)
            }
            .store(in: &cancellables)
        
        addWorkoutSubject
            .sink { workout in
                CoreDataHandler.shared.saveWorkout(workout)
                CoreDataHandler.shared.saveDuplicateWorkout(workout)
            }
            .store(in: &cancellables)
    }
    
    func fetchWorkouts() {
        fetchWorkoutsSubject.send(())
    }
    
    func deleteWorkout(id: UUID) {
        deleteWorkoutSubject.send(id)
        fetchWorkouts()
    }
    
    func addWorkout(workout: WorkoutData) {
        addWorkoutSubject.send(workout)
        fetchWorkouts()
    }
    
    func addWorkoutDirectly(workout: WorkoutData) {
        workouts.append(workout)
        CoreDataHandler.shared.saveWorkout(workout)
        fetchWorkouts()
    }
}
