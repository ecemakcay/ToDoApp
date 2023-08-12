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
}
