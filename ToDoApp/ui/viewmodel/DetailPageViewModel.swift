//
//  DetailPageViewModel.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 13.08.2023.
//

import Foundation

class DetailPageViewModel{
    
    var trepo = TodoDaoRepository()
    
    func update (todo_id: Int, toDo: String){
        trepo.update(todo_id: todo_id, toDo: toDo)
    }
}
