//
//  ToDo.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 2.08.2023.
//

import Foundation


class Todo {
    
    var todo_id:Int
    var todo_name: String
    
    
    init(todo_id: Int, todo_name: String) {
        self.todo_id = todo_id
        self.todo_name = todo_name
    }
}
