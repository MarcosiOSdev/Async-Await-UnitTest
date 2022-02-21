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
    
    func testSuccessfulyWhenSendingMessage() {
        viewModel.message = "Successfully"
        viewModel.send()
        waitUntil(sender.$pendingMessageCount, equals: 1)
        
        XCTAssertEqual(viewModel.buttonTitle, SendMessageViewModel.Constants.textSending)
        XCTAssertTrue(viewModel.isSendingDisabled)
        
        sender.sendPendingMessages()
        waitUntil(viewModel.$message, equals: "")
        
        XCTAssertEqual(viewModel.buttonTitle, SendMessageViewModel.Constants.textWasSend)        
    }
    
    func testWithErrorNil() {
        
        viewModel.message = "Just test nil"
        viewModel.send()
        waitUntil(sender.$pendingMessageCount, equals: 1)
        
        sender.withError = .containNil
        sender.sendPendingMessages()        
        waitUntil(viewModel.$errorText, equals: MessageSenderError.containNil.localizedDescription)
        XCTAssertEqual(viewModel.message, "Just test nil")
    }
    
    func testWithErrorWhenWasError() {
        viewModel.message = "Just test error"
        viewModel.send()
        waitUntil(sender.$pendingMessageCount, equals: 1)
        
        sender.withError = .containError
        sender.sendPendingMessages()
        waitUntil(viewModel.$errorText, equals: MessageSenderError.containError.localizedDescription)
        XCTAssertEqual(viewModel.message, "Just test error")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
