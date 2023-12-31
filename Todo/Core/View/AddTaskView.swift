//
//  AddTaskView.swift
//  Todo
//
//  Created by Krishnatrea on 15/09/23.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager : RealmManger
    @State private var title : String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if title != ""  {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.325, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .ignoresSafeArea()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManger())
    }
}
