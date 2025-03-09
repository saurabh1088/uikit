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
    /// A lazily initialized programmatically created button to optimize initial load, initialized with a frame and configured with Auto Layout constraints.
    /// Lazy Initialization: Defer the creation of `btnExampleThree` until it’s needed (e.g., in viewWillAppear) to optimize initial load time
    private lazy var btnExampleThree: CustomizableButton = {
        // Constraints are being set for this button in func addConstraintsForButtonThree
        // hence frame here can be anything.
        let btnConfigThree = ButtonsExample.three
        let button = CustomizableButton(frame: .zero,
                                        title: btnConfigThree.title,
                                        font: btnConfigThree.font,
                                        textColor: btnConfigThree.textColor)
        button.setBackground(to: btnConfigThree.backgroundType)
        return button
    }()
    
    private lazy var btnExampleFour: CustomizableButton = {
        // Constraints are being set for this button in func addConstraintsForButtonFour
        // hence frame here can be anything.
        let btnConfigFour = ButtonsExample.four
        let button = CustomizableButton(frame: .zero,
                                        title: btnConfigFour.title,
                                        font: btnConfigFour.font,
                                        textColor: btnConfigFour.textColor)
        button.setBackground(to: btnConfigFour.backgroundType)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupXIBButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(btnExampleThree) // Add programmatic button when view appears
        view.addSubview(btnExampleFour) // Add programmatic button when view appears
        addConstraintsForButtonThree()
        addConstraintsForButtonFour()
    }
    
    private func setupXIBButtons() {
        configure(button: btnExampleOne, forExample: .one)
        configure(button: btnExampleTwo, forExample: .two)
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
        button.setBackground(to: example.backgroundType)
    }
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleThree).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonThree() {
        btnExampleThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleThree.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            btnExampleThree.topAnchor.constraint(equalTo: btnExampleTwo.bottomAnchor, constant: 8),
            btnExampleThree.widthAnchor.constraint(equalToConstant: 300),
            btnExampleThree.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleThree).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonFour() {
        btnExampleFour.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleFour.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            btnExampleFour.topAnchor.constraint(equalTo: btnExampleThree.bottomAnchor, constant: 8),
            btnExampleFour.widthAnchor.constraint(equalToConstant: 300),
            btnExampleFour.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
