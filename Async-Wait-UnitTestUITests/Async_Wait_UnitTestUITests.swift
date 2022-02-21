//
//  Async_Wait_UnitTestUITests.swift
//  Async-Wait-UnitTestUITests
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import XCTest
import Async_Wait_UnitTest

class Async_Wait_UnitTestUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNavigationByApp() throws {
        let app = XCUIApplication()
        app.launch()
        
        let senderButton = app.buttons["SendButton"]
        let errorText = app.staticTexts["ErrorMessageText"]
        let messageText = app.textViews["MessageTextEditor"]
        
        // On Launch
        XCTAssertFalse(errorText.exists)
        XCTAssertFalse(senderButton.isEnabled)

        // When write something
        messageText.tap()
        
        app.keys["T"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        XCTAssertTrue(senderButton.isEnabled)
        screenShot(app: app, name: "after_write_something")
        
        // When send something.
        senderButton.tap()
        XCTAssertFalse(senderButton.isEnabled)
    }
    
    func testErrorOnSend() throws {
        let app = XCUIApplication()
        app.launch()
        
        let senderButton = app.buttons["SendButton"]
        let errorText = app.staticTexts["ErrorMessageText"]
        let messageText = app.textViews["MessageTextEditor"]
        
        // On Launch
        XCTAssertFalse(errorText.exists)
        XCTAssertFalse(senderButton.isEnabled)

        // When write something
        messageText.tap()
        
        app.buttons["shift"].tap()
        app.keys["e"].tap()
        app.keys["r"].tap()
        app.keys["r"].tap()
        app.keys["o"].tap()
        XCTAssertTrue(senderButton.isEnabled)
        screenShot(app: app, name: "after_write_something")
        
        // When send something.
        senderButton.tap()
        XCTAssertFalse(senderButton.isEnabled)
        
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: errorText, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        screenShot(app: app, name: "with_error")
    }
    
    private func screenShot(
        app: XCUIApplication,
        name: String
    ) {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
