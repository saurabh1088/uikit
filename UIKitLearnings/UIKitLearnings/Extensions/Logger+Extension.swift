//
//  Logger+Extension.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 25/05/24.
//

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
}

extension Logger {
    static let networkingURLSession = Logger(subsystem: subsystem, category: "Networking with URLSession")
    static let networkingAlamofire = Logger(subsystem: subsystem, category: "Networking with Alamofire")
}

extension Logger {
    static let uiTableViewDelegateCallbacks = Logger(subsystem: subsystem, category: "UITableViewDelegate callbacks")
    static let uiViewControllerEvent = Logger(subsystem: subsystem, category: "UIViewController event")
    static let uiViewEvents = Logger(subsystem: subsystem, category: "UIView events")
}

extension Logger {
    static let appLifeCycle = Logger(subsystem: subsystem, category: "App Lifecycle")
}

extension Logger {
    static let uiStoryboardEvent = Logger(subsystem: subsystem, category: "UIStoryboard event")
}

extension Logger {
    static let appSceneEvent = Logger(subsystem: subsystem, category: "App scene event")
}
