//
//  TaskView.swift
//  Todo
//
//  Created by Krishnatrea on 15/09/23.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager : RealmManger
    var body: some View {
        VStack {
            Text("My Task")
                .font(.title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id ) {
                  task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }

                        
                    }
                }.listRowSeparator(.hidden)
            }
            .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManger())
    }
}
