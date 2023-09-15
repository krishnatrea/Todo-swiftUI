//
//  ContentView.swift
//  Todo
//
//  Created by Krishnatrea on 15/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManger = RealmManger()
    @State private var showAddTaskView : Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManger)
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
                .environmentObject(realmManger)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
