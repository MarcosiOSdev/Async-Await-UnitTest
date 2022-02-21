//
//  MessageSenderMock.swift
//  Async-Wait-UnitTestTests
//
//  Created by marcos.felipe.souza on 20/02/22.
//

@testable import Async_Wait_UnitTest
import Combine

class MessageSenderMock: MessageSender {
    @Published private(set) var pendingMessageCount = 0
    private var pendingMessageContinuations = [CheckedContinuation<Void, Error>]()

    func sendMessage(_ message: String) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            pendingMessageContinuations.append(continuation)
            pendingMessageCount += 1
        }
    }

    func sendPendingMessages() {
        let continuations = pendingMessageContinuations
        pendingMessageContinuations = []
        pendingMessageCount = 0
        continuations.forEach { $0.resume() }
    }

    func triggerError(_ error: Error) {
        let continuations = pendingMessageContinuations
        pendingMessageContinuations = []
        pendingMessageCount = 0
        continuations.forEach { $0.resume(throwing: error) }
    }
}
