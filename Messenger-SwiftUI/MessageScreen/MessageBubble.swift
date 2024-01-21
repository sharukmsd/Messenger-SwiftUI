//
//  MessageBubble.swift
//  Messenger-SwiftUI
//
//  Created by Shahrukh on 21/01/2024.
//

import SwiftUI

struct MessageBubble: View {
    let message: String
    let isMyMessage: Bool
    
    init(_ message: String, isMyMessage: Bool) {
        self.message = message
        self.isMyMessage = isMyMessage
    }
    
    var body: some View {
        
        MessageText(message)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(isMyMessage ? Color.receiverBubble : Color.senderBubble))


    }
}

struct MessageText: View {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    var body: some View {
        
        Text(message)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.leading)
            .padding(.vertical, 8)
            .padding(.horizontal)
        
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble("Hello, how are you?", isMyMessage: true)
    }
}
