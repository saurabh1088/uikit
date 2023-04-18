//
//
// ToDoListItemTableViewCell.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 17/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit

class ToDoListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var currentStatus: UILabel!
    @IBOutlet weak var createdOn: UILabel!
    @IBOutlet weak var toDoItem: UILabel!
    
    var id: UUID?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
