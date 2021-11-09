//
//  MockMessageView.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import SwiftUI

struct PokeMessageView: View {
    
    var message: Message
    
    var body: some View {
        VStack {
            if (!message.user.isMe) {
                VStack {
                    HStack {
                        Image(message.user.avatar)
                            .resizable()
                            .frame(minWidth: 10, idealWidth: 40, maxWidth: 40, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .leading)
                            .cornerRadius(20)
                            .padding(.leading, 10)
                            .scaledToFit()
                        if (message.content != "") {
                            PokeMessageContentView(contentMessage: message.content, isMyMessage: message.user.isMe)
                        } else {
                            PlayHapticButtonView()
                            Text("Play haptic message")
                                .opacity(0.4)
                        }
                        
                        Spacer()
                    }
                    HStack {
                        if (message.content != "") {
                            PlayHapticButtonView()
                                .padding(.leading, 10)
                            Text("Play haptic message")
                                .opacity(0.4)
                        }
                        Spacer()
                    }
                    
                }
                
                
            } else {
                VStack {
                    HStack {
                        Spacer()
                        if (message.content != "") {
                            PokeMessageContentView(contentMessage: message.content, isMyMessage: message.user.isMe)
                                .padding(.trailing, 10)
                        } else {
                            Spacer()
                            Text("Play haptic message")
                                .opacity(0.4)
                            PlayHapticButtonView()
                                .padding(.trailing, 10)
                        }
                        
                    }
                    HStack {
                        Spacer()
                        if (message.content != "") {
                            Text("Play haptic message")
                                .opacity(0.4)
                            PlayHapticButtonView()
                                .padding(.trailing, 10)
                        }
                    }
                }
            }
        }
    }
}

struct MockMessageView_Previews: PreviewProvider {
    static var message = Message(content: "", user: User(name: "Quang", avatar: "a1", isMe: false))
    
    static var previews: some View {
        PokeMessageView(message: message)
    }
}
