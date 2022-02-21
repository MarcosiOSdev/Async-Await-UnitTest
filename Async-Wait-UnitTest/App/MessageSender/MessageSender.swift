//
//  MessageSender.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import Combine

protocol MessageSender: AnyObject {
    func sendMessage(_ message: String) async throws
}
