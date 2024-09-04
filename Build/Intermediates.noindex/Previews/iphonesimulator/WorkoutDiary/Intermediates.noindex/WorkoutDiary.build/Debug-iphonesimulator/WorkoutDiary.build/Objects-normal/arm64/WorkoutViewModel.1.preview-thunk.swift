@_private(sourceFile: "WorkoutViewModel.swift") import WorkoutDiary
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import Combine

extension WorkoutViewModel {
    @_dynamicReplacement(for: addWorkoutDirectly(workout:)) private func __preview__addWorkoutDirectly(workout: WorkoutData) {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutViewModel.swift", line: 60)
        workouts.append(workout)
        CoreDataHandler.shared.saveWorkout(workout)
        fetchWorkouts()
    
#sourceLocation()
    }
}

extension WorkoutViewModel {
    @_dynamicReplacement(for: addWorkout(workout:)) private func __preview__addWorkout(workout: WorkoutData) {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutViewModel.swift", line: 55)
        addWorkoutSubject.send(workout)
        fetchWorkouts()
    
#sourceLocation()
    }
}

extension WorkoutViewModel {
    @_dynamicReplacement(for: deleteWorkout(id:)) private func __preview__deleteWorkout(id: UUID) {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutViewModel.swift", line: 50)
        deleteWorkoutSubject.send(id)
        fetchWorkouts()
    
#sourceLocation()
    }
}

extension WorkoutViewModel {
    @_dynamicReplacement(for: fetchWorkouts()) private func __preview__fetchWorkouts() {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutViewModel.swift", line: 46)
        fetchWorkoutsSubject.send(())
    
#sourceLocation()
    }
}

extension WorkoutViewModel {
    @_dynamicReplacement(for: bindInputs()) private func __preview__bindInputs() {
        #sourceLocation(file: "/Users/azamataidanov/Desktop/WorkoutDiary/WorkoutDiary/List/WorkoutViewModel.swift", line: 24)
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
    
#sourceLocation()
    }
}

import class WorkoutDiary.WorkoutViewModel

