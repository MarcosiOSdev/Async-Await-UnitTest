//
//  SendMessageViewModel.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import Combine

@MainActor class SendMessageViewModel: ObservableObject {
    
    @Published
    var message: String = ""
    
    @Published
    private(set) var errorText: String?
    
    var buttonTitle: String { isSending ? "Sending..." : "Send"}
    var isSendingDisabled: Bool { isSending  || message.isEmpty }
    
    private let sender: MessageSender
    private var isSending = false
    
    init(sender: MessageSender) {
        self.sender = sender
    }
    
    func send() {
        guard !message.isEmpty else { return }
        guard !isSending else { return }
        
        isSending = true
        errorText = nil
        
        Task {
            do {
                try await sender.sendMessage(message)
                message = ""
            } catch {
                errorText = error.localizedDescription
            }
            
            isSending = false
        }
    }
}

