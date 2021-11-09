//
//  MockMessageChatHelper.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import Foundation

class ChatDataSource: ObservableObject  {
    let currentUser = User(name: "Mark", avatar: "a1", isMe: true)
    var users: [User] = []
    @Published var messageHistory: [User:[Message]] = [:]
    
    init() {
        let user1 = User(name: "Johny", avatar: "a2", isMe: false)
        let user2 = User(name: "Bobby", avatar: "a3", isMe: false)
        let user3 = User(name: "Max", avatar: "a4", isMe: false)
        let user4 = User(name: "Bobby", avatar: "a5", isMe: false)
        let user5 = User(name: "Marry", avatar: "a6", isMe: false)
        let user6 = User(name: "Jane", avatar: "a7", isMe: false)
        
        users.append(user1)
        messageHistory[user1] = []
        users.append(user2)
        messageHistory[user2] = []
        users.append(user3)
        messageHistory[user3] = []
        users.append(user4)
        messageHistory[user4] = []
        users.append(user5)
        messageHistory[user5] = []
        users.append(user6)
        messageHistory[user6] = []
        
        
        messageHistory[user1]?.append(Message(content: "Hey, how you doing?", user: currentUser))
        messageHistory[user1]?.append(Message(content: "Great over hear!", user: user1))
        messageHistory[user1]?.append(Message(content: "Hangout?", user: user1))
        messageHistory[user1]?.append(Message(content: "Yeah!", user: currentUser))
        messageHistory[user1]?.append(Message(content: "", user: currentUser))
        messageHistory[user1]?.append(Message(content: "", user: user1))
        
        messageHistory[user2]?.append(Message(content: "You good?", user: currentUser))
        messageHistory[user2]?.append(Message(content: "Better than ever", user: user2))
        messageHistory[user2]?.append(Message(content: "nudge*", user: user2))
        
    }
    
    
}
