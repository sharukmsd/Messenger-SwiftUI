//
//  Message.swift
//  Messenger-SwiftUI
//
//  Created by Shahrukh on 21/01/2024.
//

import Foundation

struct Message: Identifiable, Hashable {
    var id: UUID
    var sender: String
    var content: String
    var timestamp: Date
    var isMyMessage: Bool
    var senderImage: String // Assuming this is a URL
}

// Mock data
extension Message {
    static var mockMessages: [Message] {
        return [
            Message(id: UUID(),
                    sender: "John",
                    content: "Hello there!",
                    timestamp: Date(),
                    isMyMessage: false, senderImage: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=3164&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            Message(id: UUID(),
                    sender: "Alice",
                    content: "Hi John! How are you?",
                    timestamp: Date().addingTimeInterval(10),
                    isMyMessage: true,
                    senderImage: "https://images.unsplash.com/photo-1521119989659-a83eee488004?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D"),
            Message(id: UUID(),
                    sender: "John",
                    content: "I'm good, thanks! How about you?",
                    timestamp: Date().addingTimeInterval(20),
                    isMyMessage: false,
                    senderImage: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=3164&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            Message(id: UUID(),
                    sender: "Alice",
                    content: "I'm doing well too. Any plans for the weekend?",
                    timestamp: Date().addingTimeInterval(30),
                    isMyMessage: true,
                    senderImage: "https://images.unsplash.com/photo-1521119989659-a83eee488004?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cG9ydHJhaXR8ZW58MHx8MHx8fDA%3D"),
        ]
    }
}
