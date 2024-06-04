//
//  AnimationsOptionTests.swift
//  UIKitLearningsTests
//
//  Created by Saurabh Verma on 04/06/24.
//

import XCTest
@testable import UIKitLearnings

final class AnimationsOptionTests: XCTestCase {

    func test_animationsOptionsIndexes_success() {
        XCTAssertEqual(AnimationsOption.circularProgressView, AnimationsOption.optionFor(index: 0))
        XCTAssertEqual(AnimationsOption.imageView, AnimationsOption.optionFor(index: 1))
        XCTAssertEqual(AnimationsOption.rectangularView, AnimationsOption.optionFor(index: 2))
    }
    
    func test_animationsOptionsIndexes_failure() {
        XCTAssertNil(AnimationsOption.optionFor(index: 3))
    }
    
    func test_cellReUseIdentifiers() {
        XCTAssertEqual("circularProgressAnimationTableViewCell", AnimationsOption.circularProgressView.cellReUseIdentifier)
        XCTAssertEqual("imageAnimationTableViewCell", AnimationsOption.imageView.cellReUseIdentifier)
        XCTAssertEqual("rectangularAnimationTableViewCell", AnimationsOption.rectangularView.cellReUseIdentifier)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
