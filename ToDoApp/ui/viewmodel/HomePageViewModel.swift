//
//  HomePageViewModel.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 13.08.2023.
//

import Foundation
import RxSwift

class HomePageViewModel{
    var trepo = TodoDaoRepository()
    var  todoList = BehaviorSubject<[Todo]>(value: [Todo]())
    
    //todoLists are attached when the object is created
    init() {
        copyDatabase()
        todoList = trepo.todoList
        
    }
    
    func delete (todo_id: Int){
        trepo.delete(todo_id: todo_id)
        uploadTodo()
    }
    
    func search(searchWord: String){
        trepo.search(searchWord: searchWord)
    }
    
    func uploadTodo(){
        trepo.uploadTodo()
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: filePath).appendingPathComponent("todo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: dbURL.path()){
            print("File already exist")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: dbURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}
