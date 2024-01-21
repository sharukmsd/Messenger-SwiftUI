//
//  SenderMessageBubble.swift
//  Messenger-SwiftUI
//
//  Created by Shahrukh on 21/01/2024.
//

import SwiftUI

struct SenderMessageBubble: View {
    
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var body: some View {
        HStack {
            HStack{
                AsyncImageView(url: message.senderImage) { image in
                    image
                        .resizable()
                        .frame(width: 48, height: 48, alignment: .center)
                        .clipShape(Circle())
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: 48, height: 48, alignment: .center)
                }
                
                MessageBubble(message.content, isMyMessage: message.isMyMessage)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)

            Spacer()
        }
    }
}

struct SenderMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        SenderMessageBubble(Message.mockMessages.first!)
    }
}
