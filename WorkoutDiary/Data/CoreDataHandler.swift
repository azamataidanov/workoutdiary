//
//  CoreDataHandler.swift
//  WorkoutDiary
//
//  Created by Михаил Щербаков on 30.08.2024.
//

import CoreData
import SwiftUI


class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    private init() {}
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    // MARK: - Core Data Stack
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WorkoutDataModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // MARK: - WorkoutData CRUD Operations
    
    // Fetch all Workouts
    func fetchWorkouts() -> [WorkoutData] {
        let request: NSFetchRequest<WorkoutEntity> = WorkoutEntity.fetchRequest()
        
        do {
            let workoutEntities = try context.fetch(request)
            return workoutEntities.compactMap { mapEntityToWorkoutModel($0) }
        } catch {
            print("Failed to fetch workouts: \(error)")
            return []
        }
    }
    
    // Add or Update a Workout
    func saveWorkout(_ workout: WorkoutData) {
        let entity = findWorkoutEntity(withID: workout.id) ?? WorkoutEntity(context: context)
        entity.id = workout.id
        entity.title = workout.title
        entity.rounds = Int32(workout.rounds)
        entity.repeats = Int32(workout.repeats)
        
        saveContext()
    }
    
    func saveDuplicateWorkout(_ workout: WorkoutData) {
        let duplicateWorkout = WorkoutData(id: workout.id, title:workout.title, rounds: workout.rounds, repeats: workout.repeats)
        saveWorkout(duplicateWorkout)
    }
    
    // Delete a Workout
    func deleteWorkout(withID id: UUID) {
        if let entityToDelete = findWorkoutEntity(withID: id) {
            context.delete(entityToDelete)
            saveContext()
        }
    }
    
    // MARK: - Private Helper Methods
    
    private func findWorkoutEntity(withID id: UUID) -> WorkoutEntity? {
        let request: NSFetchRequest<WorkoutEntity> = WorkoutEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            return try context.fetch(request).first
        } catch {
            print("Failed to find Workout entity with id \(id): \(error)")
            return nil
        }
    }
    
    private func mapEntityToWorkoutModel(_ entity: WorkoutEntity) -> WorkoutData? {
        if let id = entity.id, let title = entity.title {
            return WorkoutData(
                id: id,
                title: title,
                rounds: Int(entity.rounds),
                repeats: Int(entity.repeats)
            )
        }
        return nil
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
