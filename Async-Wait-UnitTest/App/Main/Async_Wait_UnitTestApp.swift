//
//  Async_Wait_UnitTestApp.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import SwiftUI

@main
struct Async_Wait_UnitTestApp: App {
    var body: some Scene {
        WindowGroup {
            MainBuilder.shared.makeSendMessageView()
        }
    }
}
