//
//  TodoDaoRepository.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 13.08.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository {
    
    var  todoList = BehaviorSubject<[Todo]>(value: [Todo]()) //
    func save (toDo: String){
        print("To Do: \(toDo)")
    }
    
    func update (todo_id: Int, toDo: String){
        print(" Updated To Do: \(toDo)")
    }
    
    func delete (todo_id: Int){
        print(" Delete To Do: \(todo_id)")
    }
    
    func search(searchWord: String){
        print("Search todo: \(searchWord)")
    }
    
    func uploadTodo(){
        
        var list = [Todo]()
        
        let t1 = Todo(todo_id: 1, todo_name: "Read a book")
        let t2 = Todo(todo_id: 2, todo_name: "Study IOS")
        let t3 = Todo(todo_id: 3, todo_name: "Go to gym")
        let t4 = Todo(todo_id: 4, todo_name: "Design todo app")
        
        list.append(t1)
        list.append(t2)
        list.append(t3)
        list.append(t4)
        
        todoList.onNext(list)
    }
}
