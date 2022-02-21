//
//  MainBuilderTests.swift
//  Async-Wait-UnitTestTests
//
//  Created by marcos.felipe.souza on 21/02/22.
//

import XCTest
import SwiftUI
@testable import Async_Wait_UnitTest

@MainActor class MainBuilderTests: XCTestCase {

    var sut: MainBuilder!
    @MainActor override func setUp() {
        super.setUp()
        sut = MainBuilder.shared
    }

    func testMakeASendMessageView() throws {
        let view = sut.makeSendMessageView()
        XCTAssertTrue(view is SendMessageView)
    }

}
