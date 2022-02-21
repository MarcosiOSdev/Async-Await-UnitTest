//
//  MessageSenderService.swift
//  Async-Wait-UnitTestTests
//
//  Created by marcos.felipe.souza on 21/02/22.
//

import XCTest

@testable import Async_Wait_UnitTest

class MessageSenderServiceTests: XCTestCase {

    
    private var sut: MessageSenderService!
    
    override func setUp() {
        sut = MessageSenderService()
    }

    func testSuccessfullyWithMessage() async throws {
        let result: ()? = try? await sut.sendMessage("success")
        XCTAssertNotNil(result)
    }
    
    func testFailureWhenSendNil() async throws {
        do {
            try await sut.sendMessage("nil")
        } catch {
            XCTAssertEqual(error.localizedDescription, MessageSenderError.containNil.localizedDescription)
        }
    }
    
    func testFailureWhenSendError() async throws {
        do {
            try await sut.sendMessage("Contain error word here !")
        } catch {
            XCTAssertEqual(error.localizedDescription, MessageSenderError.containError.localizedDescription)
        }
    }
}
