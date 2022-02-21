//
//  Async_Wait_UnitTestTests.swift
//  Async-Wait-UnitTestTests
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import XCTest
@testable import Async_Wait_UnitTest

@MainActor class SendMessageViewModelTests: XCTestCase {

    private var sender: MessageSenderMock!
    private var viewModel: SendMessageViewModel!
    
    @MainActor override func setUp() {
        super.setUp()
        sender = MessageSenderMock()
        viewModel = SendMessageViewModel(sender: sender)
    }


    func testSendingDisabledWhileMessageIsEmpty() {
        XCTAssertTrue(viewModel.isSendingDisabled)
        viewModel.message = "Message"
        XCTAssertFalse(viewModel.isSendingDisabled)
        viewModel.message = ""
        XCTAssertTrue(viewModel.isSendingDisabled)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
