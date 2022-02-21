//
//  ContentView.swift
//  Async-Wait-UnitTest
//
//  Created by marcos.felipe.souza on 20/02/22.
//

import SwiftUI

struct SendMessageView: View {
    
    @ObservedObject var viewModel: SendMessageViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your message:")
            
            TextEditor(text: $viewModel.message)
                .textCase(.lowercase)
                .accessibilityIdentifier("MessageTextEditor")
            
            Button(viewModel.buttonTitle) {
                viewModel.send()
            }
            .disabled(viewModel.isSendingDisabled)
            .accessibilityIdentifier("SendButton")
            
            if let errorMessage = viewModel.errorText {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .accessibilityIdentifier("ErrorMessageText")
            }
            Spacer()
        }
    }
}
