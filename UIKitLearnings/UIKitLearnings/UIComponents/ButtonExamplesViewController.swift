//
//  ButtonExamplesViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/03/25.
//

import UIKit
import SwiftUIKitLib

/// This view controller demonstrates various uses of CustomizableButton.
class ButtonExamplesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var btnExampleOne: CustomizableButton!
    @IBOutlet weak var btnExampleTwo: CustomizableButton!
    
    // MARK: - Private Properties
    private var btnExampleThree: CustomizableButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupXIBButtons()
        setupProgrammaticButtons()
        addConstraintsForButtonThree()
    }
    
    private func setupXIBButtons() {
        configure(button: btnExampleOne, forExample: .one)
        configure(button: btnExampleTwo, forExample: .two)
    }
    
    private func setupProgrammaticButtons() {
        createButtonThree()
    }
    
    private func configure(button: CustomizableButton?, forExample example: ButtonsExample) {
        guard let button else { return }
        button.setupWith(title: example.title,
                         font: example.font,
                         textColor: example.textColor)
        button.applyBackground(example.backgroundType)
    }
    
    private func createButtonThree() {
        // Constraints are being set for this button in func addConstraintsForButtonThree
        // hence frame here can be anything.
        btnExampleThree = CustomizableButton(frame: CGRect(),
                                             title: "Button Example Three",
                                             font: UIFont.systemFont(ofSize: 17),
                                             textColor: .red)
        guard let btnExampleThree else { return }
        btnExampleThree.applyBackground(.color(.yellow))
        self.view.addSubview(btnExampleThree)
    }
    
    private func addConstraintsForButtonThree() {
        guard let button = btnExampleThree else { return }
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            button.topAnchor.constraint(equalTo: self.btnExampleTwo.bottomAnchor, constant: 8),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
