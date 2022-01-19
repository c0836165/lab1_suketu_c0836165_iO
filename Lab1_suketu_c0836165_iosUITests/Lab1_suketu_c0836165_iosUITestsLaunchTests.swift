//
//  Lab1_suketu_c0836165_iosUITestsLaunchTests.swift
//  Lab1_suketu_c0836165_iosUITests
//
//  Created by Pooja Mistry on 1/18/22.
//

import XCTest

class Lab1_suketu_c0836165_iosUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
