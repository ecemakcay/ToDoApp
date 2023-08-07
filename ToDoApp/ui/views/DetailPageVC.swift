//
//  DetailPageVC.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 2.08.2023.
//

import UIKit

class DetailPageVC: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    var todo : Todo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let t = todo {
            todoTextField.text = t.todo_name
        }
        
       
     
    }
    
    @IBAction func updateButtonAct(_ sender: Any) {
        
        if let td = todoTextField.text, let t = todo{
            update(todo_id: t.todo_id,toDo: td)
        }
    }
    
    func update (todo_id: Int, toDo: String){
        print(" Updated To Do: \(toDo)")
    }
}
