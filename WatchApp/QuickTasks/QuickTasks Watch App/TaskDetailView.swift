import SwiftUI

struct TaskDetailView: View {
    let task: TaskItem

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(systemName: task.completed
                      ? "checkmark.circle.fill"
                      : "circle")
                    .font(.largeTitle)
                    .foregroundStyle(
                        task.completed ? Color.green : Color.gray
                    )

                Text(task.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text(task.completed ? "Completed" : "Pending")
                    .font(.caption)
            }
            .padding()
        }
        .navigationTitle("Details")
    }
}