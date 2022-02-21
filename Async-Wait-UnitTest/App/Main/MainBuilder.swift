//
//  MainBuilder.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import SwiftUI

class MainBuilder {
    
    static let shared = MainBuilder()
    private init() {}
    
    @MainActor func makeSendMessageView() -> some View {
        let messageSender = MessageSenderService()
        let viewModel = SendMessageViewModel(sender: messageSender)
        return SendMessageView(viewModel: viewModel)
    }    
}
