//
//  RealmManger.swift
//  Todo
//
//  Created by Krishnatrea on 15/09/23.
//

import Foundation
import RealmSwift


class RealmManger : ObservableObject {
    private(set) var localRealm : Realm?
    
    @Published private(set) var tasks : [Task] = []
    
    init(){
        openRealm()
        getAllTasks()
    }
    
    func openRealm() {
        do {
            var config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("DEBUG: Error opening realm \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    var newTask = Task(value: ["title" : taskTitle, "completed" : false] as [String : Any])
                    localRealm.add(newTask)
                    getAllTasks()
                    print("Added new task \(newTask)")
                }
            } catch {
                print("Error while adding the task \(error)")
            }
        }
    }
    
    func getAllTasks() {
        if let localRealm = localRealm {
           let allTasks =  localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            
            allTasks.forEach { task in
                tasks.append(task)
            }
            
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm  = localRealm {
            do {
               let updatedTask = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !updatedTask.isEmpty else {return }
                
                try localRealm.write {
                    updatedTask[0].completed = completed
                    getAllTasks()
                }
            } catch {
                print("Error while updating the task \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                 guard !taskToDelete.isEmpty else {return }
                
                try localRealm.write{
                    localRealm.delete(taskToDelete)
                    getAllTasks()
                }
            }catch {
                print("Error while deleting the task \(error)")
            }
        }
        
    }
    
 }
