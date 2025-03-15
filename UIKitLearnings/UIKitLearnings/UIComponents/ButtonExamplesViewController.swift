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
    
    private lazy var btnExampleFive: CustomizableButton = {
        // Constraints are being set for this button in func addConstraintsForButtonFive
        // hence frame here can be anything.
        let btnConfigFive = ButtonsExample.five
        let button = CustomizableButton(frame: .zero,
                                        title: btnConfigFive.title,
                                        font: btnConfigFive.font,
                                        textColor: btnConfigFive.textColor)
        button.setBackground(to: btnConfigFive.backgroundType)
        return button
    }()
    
    private lazy var btnExampleSix: CustomizableButton = {
        // Constraints are being set for this button in func addConstraintsForButtonSix
        // hence frame here can be anything.
        let btnConfigSix = ButtonsExample.six
        let button = CustomizableButton(frame: .zero,
                                        title: btnConfigSix.title,
                                        font: btnConfigSix.font,
                                        textColor: btnConfigSix.textColor)
        button.setBackground(to: btnConfigSix.backgroundType)
        button.setBorder(with: 10, color: .black)
        button.setCornerRadius(10)
        return button
    }()
    
    private lazy var btnExampleSeven: CustomizableButton = {
        // Constraints are being set for this button in func addConstraintsForButtonSeven
        // hence frame here can be anything.
        let btnConfigSeven = ButtonsExample.seven
        let button = CustomizableButton(frame: .zero,
                                        title: btnConfigSeven.title,
                                        font: btnConfigSeven.font,
                                        textColor: btnConfigSeven.textColor)
        button.setBackground(to: btnConfigSeven.backgroundType)
        button.setCornerRadius(10)
        button.setShadow(offset: CGSize(width: 5.0, height: 5.0),
                         radius: 10.0,
                         opacity: 0.5,
                         color: .blue)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupXIBButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Add programmatic buttons when view appears
        view.addSubview(btnExampleThree)
        view.addSubview(btnExampleFour)
        view.addSubview(btnExampleFive)
        view.addSubview(btnExampleSix)
        view.addSubview(btnExampleSeven)
        
        // Add constrains for programmatically added buttons
        addConstraintsForButtonThree()
        addConstraintsForButtonFour()
        addConstraintsForButtonFive()
        addConstraintsForButtonSix()
        addConstraintsForButtonSeven()
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
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleFour).
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
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleFive).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonFive() {
        btnExampleFive.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleFive.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            btnExampleFive.topAnchor.constraint(equalTo: btnExampleFour.bottomAnchor, constant: 8),
            btnExampleFive.widthAnchor.constraint(equalToConstant: 300),
            btnExampleFive.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleSix).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonSix() {
        btnExampleSix.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleSix.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            btnExampleSix.topAnchor.constraint(equalTo: btnExampleFive.bottomAnchor, constant: 8),
            btnExampleSix.widthAnchor.constraint(equalToConstant: 300),
            btnExampleSix.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleSeven).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonSeven() {
        btnExampleSeven.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleSeven.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            btnExampleSeven.topAnchor.constraint(equalTo: btnExampleSix.bottomAnchor, constant: 8),
            btnExampleSeven.widthAnchor.constraint(equalToConstant: 300),
            btnExampleSeven.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @IBAction func btnExampleOne(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert",
                                                message: "This is an example alert.",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        if let viewController = sender as? UIViewController {
            viewController.present(alertController, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
