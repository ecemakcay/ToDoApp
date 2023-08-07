//
//  TodoCell.swift
//  ToDoApp
//
//  Created by Ecem Akçay on 7.08.2023.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoContentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
