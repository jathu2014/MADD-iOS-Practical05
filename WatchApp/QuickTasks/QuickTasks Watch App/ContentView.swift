import SwiftUI

struct ContentView: View {
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: false),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: false)
    ]

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 4) {
                Text("\(completedCount) / \(tasks.count) Completed")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        Section {
                            Button {
                                tasks[index].completed.toggle()
                            } label: {
                                HStack {
                                    Image(
                                        systemName: tasks[index].completed
                                            ? "checkmark.circle.fill"
                                            : "circle"
                                    )
                                    .foregroundStyle(
                                        tasks[index].completed
                                            ? Color.green
                                            : Color.gray
                                    )

                                    Text(tasks[index].title)

                                    Spacer()
                                }
                            }
                            .accessibilityLabel(tasks[index].title)
                            .accessibilityValue(
                                tasks[index].completed
                                    ? "Completed"
                                    : "Pending"
                            )
                            .accessibilityHint(
                                "Double tap to change completion"
                            )

                            NavigationLink {
                                TaskDetailView(task: tasks[index])
                            } label: {
                                Label("Details", systemImage: "info.circle")
                            }
                        }
                    }

                    Button {
                        for index in tasks.indices {
                            tasks[index].completed = false
                        }
                    } label: {
                        Label(
                            "Reset Tasks",
                            systemImage: "arrow.counterclockwise"
                        )
                    }
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}
