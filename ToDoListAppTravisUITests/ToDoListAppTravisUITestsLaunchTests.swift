//
//  ToDoListAppTravisUITestsLaunchTests.swift
//  ToDoListAppTravisUITests
//
//  Created by Fabian Hofer on 03.06.24.
//

import XCTest

final class ToDoListAppTravisUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunch() throws {
        print("start testLaunch")
        let app = XCUIApplication()
        app.launch()
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
        print("end testLaunch")
        
    }
}
