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
    
    var viewModel = HomePageViewModel()
    var todoList = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
    
        _ = viewModel.todoList.subscribe(onNext: { list in
            self.todoList = list
            self.todoTableView.reloadData()
        })
        
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadTodo()
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
        viewModel.search(searchWord: searchText)
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){contextualAction,view,bool in
            
            let todo = self.todoList[indexPath.row]
           
            
            let alert = UIAlertController(title: "Delete", message: "Do you want  \(todo.todo_name) delete? ", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancel)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){
                action in
                
                self.viewModel.delete(todo_id: todo.todo_id)

            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
