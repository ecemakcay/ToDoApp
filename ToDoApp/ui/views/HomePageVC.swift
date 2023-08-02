//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 2.08.2023.
//

import UIKit

class HomePageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func detailButtonAct(_ sender: Any) {
        
        let todo = Todo(todo_id: 13, todo_name: "do something")
        
        performSegue(withIdentifier: "toDetail", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let todo = sender as? Todo{
                let destinationVC = segue.destination as! DetailPageVC
                destinationVC.todo = todo
            }
        }
    }
}

