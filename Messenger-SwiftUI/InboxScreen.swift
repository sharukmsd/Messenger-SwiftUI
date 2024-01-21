//
//  InboxScreen.swift
//  Messenger-SwiftUI
//
//  Created by Shahrukh on 21/01/2024.
//

import SwiftUI

struct InboxScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(Message.mockMessages) { message in
                    Text(message.content)
                }
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
