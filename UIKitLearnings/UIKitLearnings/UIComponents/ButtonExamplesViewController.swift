//
//  ButtonExamplesViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/03/25.
//

import UIKit
import SwiftUIKitLib

/// A view controller that demonstrates various use cases of the `CustomizableButton` class from the
/// SwiftUIKitLib framework.
/// This class showcases both storyboard/XIB-based buttons and a programmatically created button with Auto Layout constraints.
class ButtonExamplesViewController: UIViewController {
    
    // MARK: - Outlets
    /// The example buttons, configured via a storyboard or XIB outlet.
    @IBOutlet weak var btnExampleOne: CustomizableButton!
    @IBOutlet weak var btnExampleTwo: CustomizableButton!
    
    // MARK: - Private Properties
    /// A programmatically created button, initialized with a frame and configured with Auto Layout constraints.
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
    
    /// Configures a given button with a specified example style.
    /// - Parameters:
    ///   - button: The `CustomizableButton` instance to configure. If nil, the method exits early.
    ///   - example: The `ButtonsExample` enum value defining the button's style (e.g., .one, .two).
    private func configure(button: CustomizableButton?, forExample example: ButtonsExample) {
        guard let button else { return }
        button.setupWith(title: example.title,
                         font: example.font,
                         textColor: example.textColor)
        button.applyBackground(example.backgroundType)
    }
    
    /// Creates and initializes the third example button programmatically.
    /// - Note: The frame is set to an empty CGRect since constraints will define the layout in `addConstraintsForButtonThree`.
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
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleThree).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
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
