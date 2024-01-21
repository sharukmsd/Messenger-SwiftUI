//
//  MyMessageBubble.swift
//  Messenger-SwiftUI
//
//  Created by Shahrukh on 21/01/2024.
//

import SwiftUI

struct MyMessageBubble: View {
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }

    var body: some View {
        HStack {
            Spacer()
            
            MessageBubble(message.content, isMyMessage: message.isMyMessage)
                .padding(.horizontal)
                .padding(.vertical, 8)

        }
    }
}

struct MyMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MyMessageBubble(Message.mockMessages.first!)
    }
}
