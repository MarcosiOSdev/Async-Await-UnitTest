//
//  MessageSenderService.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//
import Foundation
import Combine

class MessageSenderService: MessageSender {
    
    var timeForProccessingMessage: UInt32 = 3
    
    private func getMessage(completion: @escaping ()-> Void) {
        DispatchQueue(label: "waiting-sample").async {
            sleep(self.timeForProccessingMessage)
            completion()
        }
    }
    
    
    func sendMessage(_ message: String) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            
            getMessage {
                if message.contains("erro") {
                    continuation.resume(throwing: MessageSenderError.containError)
                    return
                } else if message.contains("nil") {
                    continuation.resume(throwing: MessageSenderError.containNil)
                    return
                }
                continuation.resume()
            }
            
        }
    }
}
