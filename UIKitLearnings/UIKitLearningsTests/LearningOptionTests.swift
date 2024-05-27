//
//  LearningOptionTests.swift
//  UIKitLearningsTests
//
//  Created by Saurabh Verma on 25/05/24.
//

import XCTest
@testable import UIKitLearnings

final class LearningOptionTests: XCTestCase {

    func test_learningOptionIndexes_success() {
        XCTAssertEqual(LearningOption.notes, LearningOption.optionFor(index: 0))
        XCTAssertEqual(LearningOption.responder, LearningOption.optionFor(index: 1))
        XCTAssertEqual(LearningOption.webView, LearningOption.optionFor(index: 2))
        XCTAssertEqual(LearningOption.augmentedReality, LearningOption.optionFor(index: 3))
        XCTAssertEqual(LearningOption.animations, LearningOption.optionFor(index: 4))
        XCTAssertEqual(LearningOption.loginCoreData, LearningOption.optionFor(index: 5))
        XCTAssertEqual(LearningOption.uiComponents, LearningOption.optionFor(index: 6))
        XCTAssertEqual(LearningOption.networking, LearningOption.optionFor(index: 7))
        XCTAssertEqual(LearningOption.present, LearningOption.optionFor(index: 8))
        XCTAssertEqual(LearningOption.push, LearningOption.optionFor(index: 9))
        XCTAssertEqual(LearningOption.viewController, LearningOption.optionFor(index: 10))
    }
    
    func test_learningOptionIndexes_failure() {
        XCTAssertNil(LearningOption.optionFor(index: 11))
    }
    
    func test_cellReUseIdentifiers() {
        XCTAssertEqual("notesTableViewCell", LearningOption.notes.cellReUseIdentifier)
        XCTAssertEqual("responderTableViewCell", LearningOption.responder.cellReUseIdentifier)
        XCTAssertEqual("webViewTableViewCell", LearningOption.webView.cellReUseIdentifier)
        XCTAssertEqual("augmentedRealityTableViewCell", LearningOption.augmentedReality.cellReUseIdentifier)
        XCTAssertEqual("animationsTableViewCell", LearningOption.animations.cellReUseIdentifier)
        XCTAssertEqual("coreDataLoginTableViewCell", LearningOption.loginCoreData.cellReUseIdentifier)
        XCTAssertEqual("uiComponentsTableViewCell", LearningOption.uiComponents.cellReUseIdentifier)
        XCTAssertEqual("networkingTableViewCell", LearningOption.networking.cellReUseIdentifier)
        XCTAssertEqual("presentTableViewCell", LearningOption.present.cellReUseIdentifier)
        XCTAssertEqual("pushTableViewCell", LearningOption.push.cellReUseIdentifier)
        XCTAssertEqual("viewControllerTableViewCell", LearningOption.viewController.cellReUseIdentifier)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
