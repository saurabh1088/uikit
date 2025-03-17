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
        button.addTarget(self, action: #selector(btnExampleThreeTapped), for: .touchUpInside)
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
        button.setTapAction { [weak self] in
            self?.btnExampleFourTapped()
        }
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
        button.setBorder(with: 5, color: .paletteSeaDarkBlue)
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
                         opacity: 0.8,
                         color: .paletteSeaDarkBlue)
        return button
    }()
    
    private lazy var btnExampleEight: CustomizableButton = {
        // Constraints are being set for this button in func addConstraintsForButtonEight
        // hence frame here can be anything.
        let btnConfigEight = ButtonsExample.eight
        let button = CustomizableButton(frame: .zero,
                                        title: btnConfigEight.title,
                                        font: btnConfigEight.font,
                                        textColor: btnConfigEight.textColor)
        button.setBackground(to: btnConfigEight.backgroundType)
        button.setTapAction {
            button.showLoadingIndicator()
        }
        return button
    }()
    
    private lazy var btnExampleNine: CustomizableActivityButton = {
        // Constraints are being set for this button in func addConstraintsForButtonNine
        // hence frame here can be anything.
        let btnConfigNine = ButtonsExample.nine
        let button = CustomizableActivityButton(frame: .zero,
                                                title: btnConfigNine.title,
                                                font: btnConfigNine.font,
                                                textColor: btnConfigNine.textColor)
        button.setBackground(to: btnConfigNine.backgroundType)
        button.setTapAction { [weak self] in
            guard let self = self else { return }
            self.isBtnExampleNineLoading ? button.hideLoadingIndicator(with: String()) : button.showLoadingIndicator()
            self.isBtnExampleNineLoading.toggle()
        }
        return button
    }()
    
    private var isBtnExampleNineLoading = false

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
        view.addSubview(btnExampleEight)
        view.addSubview(btnExampleNine)
        
        // Add constrains for programmatically added buttons
        addConstraintsForButtonThree()
        addConstraintsForButtonFour()
        addConstraintsForButtonFive()
        addConstraintsForButtonSix()
        addConstraintsForButtonSeven()
        addConstraintsForButtonEight()
        addConstraintsForButtonNine()
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
            btnExampleThree.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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
            btnExampleFour.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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
            btnExampleFive.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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
            btnExampleSix.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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
            btnExampleSeven.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnExampleSeven.topAnchor.constraint(equalTo: btnExampleSix.bottomAnchor, constant: 8),
            btnExampleSeven.widthAnchor.constraint(equalToConstant: 300),
            btnExampleSeven.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleEight).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonEight() {
        btnExampleEight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleEight.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnExampleEight.topAnchor.constraint(equalTo: btnExampleSeven.bottomAnchor, constant: 8),
            btnExampleEight.widthAnchor.constraint(equalToConstant: 300),
            btnExampleEight.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    /// Adds Auto Layout constraints to position and size the programmatically created button (btnExampleNine).
    /// - Note: Constraints are relative to the view and btnExampleTwo for vertical stacking.
    private func addConstraintsForButtonNine() {
        btnExampleNine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnExampleNine.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnExampleNine.topAnchor.constraint(equalTo: btnExampleEight.bottomAnchor, constant: 8),
            btnExampleNine.widthAnchor.constraint(equalToConstant: 300),
            btnExampleNine.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @IBAction func btnExampleOneTapped(_ sender: Any) {
        showAlertWithTitle("Button Example One",
                           message: "Action on button example one triggered")
    }
    
    @IBAction func btnExampleTwoTapped(_ sender: Any) {
        showAlertWithTitle("Button Example Two",
                           message: "Action on button example two triggered")
    }
    
    @objc func btnExampleThreeTapped(_ sender: Any) {
        showAlertWithTitle("Button Example Three",
                           message: "Action on button example three triggered")
    }
    
    func btnExampleFourTapped() {
        showAlertWithTitle("Button Example Four",
                           message: "Action on button example four triggered")
    }
}

extension ButtonExamplesViewController {
    private func showAlertWithTitle(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
