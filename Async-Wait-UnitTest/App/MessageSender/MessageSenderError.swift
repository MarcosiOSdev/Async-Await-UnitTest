//
//  MessageSenderError.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import Foundation

enum MessageSenderError: Error {
    case containError
    case containNil
}
extension MessageSenderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .containError:
            return NSLocalizedString("Contain a erro word", comment: "Error with error")
        case .containNil:
            return NSLocalizedString("Just has nil word", comment: "Error Nil")
        }
    }
}
