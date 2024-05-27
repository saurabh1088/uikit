//
//  LearningOptions.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 23/05/24.
//

import Foundation

/// Advantage of governing table view cell information from here is that it made the view-controller light and concise,
/// additionally we can write unit test cases for this enumeration which wouldn't have been possible with all values
/// configured from view-controller.
enum LearningOption: String, CaseIterable {
    case notes = "Notes"
    case responder = "Responder"
    case webView = "Web View"
    case augmentedReality = "Augmented Reality"
    case animations = "Animations"
    case loginCoreData = "Login"
    case uiComponents = "UI Components"
    case networking = "Networking"
    case present = "Present"
    case push = "Push"
    case viewController = "View Controller"
    
    static func optionFor(index: Int) -> LearningOption? {
        switch index {
        case 0: return .notes
        case 1: return .responder
        case 2: return .webView
        case 3: return .augmentedReality
        case 4: return .animations
        case 5: return .loginCoreData
        case 6: return .uiComponents
        case 7: return .networking
        case 8: return .present
        case 9: return .push
        case 10: return .viewController
        default: return nil
        }
    }
    
    var cellReUseIdentifier: String {
        switch self {
        case .notes: "notesTableViewCell"
        case .responder: "responderTableViewCell"
        case .webView: "webViewTableViewCell"
        case .augmentedReality: "augmentedRealityTableViewCell"
        case .animations: "animationsTableViewCell"
        case .loginCoreData: "coreDataLoginTableViewCell"
        case .uiComponents: "uiComponentsTableViewCell"
        case .networking: "networkingTableViewCell"
        case .present: "presentTableViewCell"
        case .push: "pushTableViewCell"
        case .viewController: "viewControllerTableViewCell"
        }
    }
}
