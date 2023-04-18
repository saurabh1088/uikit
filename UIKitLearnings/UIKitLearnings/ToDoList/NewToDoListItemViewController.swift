//
//
// NewToDoListItemViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 17/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//

import UIKit

class NewToDoListItemViewController: UIViewController {
    var viewModel: ToDoItemsViewModel?
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addUpdateToDoItem(_ sender: Any) {
        if let text = textView.text {
            viewModel?.addNewToDo(text)
        }
    }
}
