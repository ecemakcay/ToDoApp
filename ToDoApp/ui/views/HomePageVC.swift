//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 2.08.2023.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var todoList = [Todo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        
        let t1 = Todo(todo_id: 1, todo_name: "Read a book")
        let t2 = Todo(todo_id: 2, todo_name: "Study IOS")
        let t3 = Todo(todo_id: 3, todo_name: "Go to gym")
        let t4 = Todo(todo_id: 4, todo_name: "Design todo app")
        
        todoList.append(t1)
        todoList.append(t2)
        todoList.append(t3)
        todoList.append(t4)
        
        
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

extension HomePageVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi ara : \(searchText)")
    }
}

extension HomePageVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todoList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoCell
        cell.todoContentLabel.text = todo.todo_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: todo)
    }
    
}
