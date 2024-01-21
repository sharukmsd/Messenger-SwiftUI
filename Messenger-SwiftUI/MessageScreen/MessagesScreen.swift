//
//  MessagesScreen.swift
//  Messenger-SwiftUI
//
//  Created by Shahrukh on 21/01/2024.
//

import SwiftUI

struct MessagesScreen: View {
    @Namespace var namespace
    @State var messages = Message.mockMessages
    @State var inputText: String = ""
    @State var newMessage: Message?
    @State private var isFocused: Bool = false
    @State private var scrollProxy: ScrollViewProxy?
    
    private func scrollToBottom(_ value: ScrollViewProxy?) {
        guard let value = value else { return }
        withAnimation (.spring()) {
            value.scrollTo(messages.last?.id, anchor: .bottom)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom) {
                
                //messages
                
                ScrollView {
                    ScrollViewReader { value in
                        
                        ForEach(messages) { message in
                            HStack {
                                
                                if message.isMyMessage {
                                    MyMessageBubble(message)
                                        .matchedGeometryEffect(id: message.id, in: namespace)
                                        .id(message.id)
                                } else {
                                    SenderMessageBubble(message)
                                }
                            }
                        }
                        .onChange(of: messages.count) { _ in
                            scrollToBottom(value)
                        }
                        .onAppear {
                            scrollProxy = value
                        }
                        
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(.bottom, 78)
                
                //message input
                
                VStack (spacing: 0) {
                    Divider()
                    
                    HStack {
                        ZStack {

                            TextField("Write", text: $inputText)
                                .textFieldStyle(.plain)
                                .padding(.horizontal, 10)
                                .onTapGesture {
                                    scrollToBottom(scrollProxy)
                                }
                                
                            
                            if let newMessage = newMessage {
                                    MyMessageBubble(newMessage)
                                        .matchedGeometryEffect(id: newMessage.id, in: namespace)
                            }

                        }

                        
                        Button {
                            
                            if !inputText.isEmpty {
                                newMessage = Message(id: UUID(), sender: "Shahrukh", content: inputText, timestamp: Date(), isMyMessage: true, senderImage: "")
                                
                                withAnimation (.spring()) {
                                    if let newMessage = newMessage {
                                        messages.append(newMessage)
                                        inputText = ""
                                    }
                                    newMessage = nil
                                }
                            }

                        } label: {
                            Image(systemName: "paperplane.fill")
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white.opacity(0.55))
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.senderBubble))
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.receiverBubble))
                    .frame(height: 40)
                    .padding()
                }

            }
            .frame(maxHeight: .infinity)
            .navigationTitle(messages.first?.sender ?? "")
            .foregroundColor(Color.white)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background.ignoresSafeArea())
        }
    }
}

struct MessagesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MessagesScreen()
    }
}
