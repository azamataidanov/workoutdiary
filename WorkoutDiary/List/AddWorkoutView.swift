import SwiftUI

struct AddWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String = ""
    @State private var rounds: String = ""
    @State private var repeats: String = ""
    
    var onSave: (WorkoutData) -> Void
    var existingWorkouts: [WorkoutData]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Workout Details")) {
                    TextField("Title", text: $title)
                    TextField("Rounds", text: $rounds)
                        .keyboardType(.numberPad)
                    TextField("Repeats", text: $repeats)
                        .keyboardType(.numberPad)
                }
                
                Button(action: saveWorkout) {
                    Text("Save Workout")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Add Workout")
            .alert(isPresented: .constant(isDuplicateTitle())) {
                Alert(title: Text("Duplicate Title"),
                      message: Text("A workout with this title already exists."),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func saveWorkout() {
        if title.isEmpty || isDuplicateTitle() {
            return
        }
        guard let rounds = Int(rounds), let repeats = Int(repeats) else {
            return
        }
        
        let newWorkout = WorkoutData(id: UUID(), title: title, rounds: rounds, repeats: repeats)
        
        presentationMode.wrappedValue.dismiss()
        
        onSave(newWorkout)
    }
    
    private func isDuplicateTitle() -> Bool {
        existingWorkouts.contains { $0.title.lowercased() == title.lowercased() }
    }
}

