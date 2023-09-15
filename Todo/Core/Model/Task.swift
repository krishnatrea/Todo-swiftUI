//
//  Task.swift
//  Todo
//
//  Created by Krishnatrea on 15/09/23.
//

import Foundation

import RealmSwift



class Task: Object, ObjectKeyIdentifiable  {
    
    @Persisted(primaryKey: true) var id : ObjectId
    
    @Persisted var title: String = ""
    
    @Persisted var completed : Bool = false
    
}
