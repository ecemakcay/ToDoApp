//
//  TodoDaoRepository.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 13.08.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository {
    
    var  todoList = BehaviorSubject<[Todo]>(value: [Todo]())
    let db:FMDatabase?
    
    init(){
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: filePath).appendingPathComponent("todo.sqlite")
        //we accessed the db
        db = FMDatabase(path: dbURL.path)
    }
    
    func save (todo_name: String){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO todos (todo_name) VALUES (?)", values: [todo_name])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func update (todo_id: Int, todo_name: String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE todos SET  todo_name = ? WHERE todo_id = ?", values: [todo_name,todo_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func delete (todo_id: Int){
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM todos WHERE todo_id = ?", values: [todo_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func search(searchWord: String){
        db?.open()
        var list = [Todo]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM todos WHERE todo_name like '%\(searchWord)%'", values: nil)
            
            while result.next(){
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_name = result.string(forColumn: "todo_name")!
                
                let todo = Todo(todo_id: todo_id, todo_name: todo_name)
                list.append(todo)
            }
            todoList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func uploadTodo(){
        
        db?.open()
        var list = [Todo]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM todos", values: nil)
            
            while result.next(){
                let todo_id = Int(result.string(forColumn: "todo_id"))!
                let todo_name = result.string(forColumn: "todo_name")!
                
                let todo = Todo(todo_id: todo_id, todo_name: todo_name)
                list.append(todo)
            }
            todoList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
}
