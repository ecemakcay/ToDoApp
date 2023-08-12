//
//  SavePageViewModel.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 13.08.2023.
//

import Foundation

class SavePageViewModel{
    
    var trepo = TodoDaoRepository()
    
    func save (toDo: String){
        trepo.save(toDo: toDo)
    }
}
