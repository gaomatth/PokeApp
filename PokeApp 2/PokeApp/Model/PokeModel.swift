//
//  MockMessageModel.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import Foundation
import CoreGraphics

class Message: Hashable, Identifiable, ObservableObject{
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID()
    @Published var content: String
    @Published var pokeRecords: [CGFloat]
    @Published var user: User
    
    init (content: String, pokeRecords: [CGFloat], user: User) {
        self.content = content
        self.user = user
        self.pokeRecords = pokeRecords
    }
    
    init (content: String, user: User) {
        self.content = content
        self.user = user
        self.pokeRecords = []
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(content)
            hasher.combine(id)
            hasher.combine(user)
    }
    
    
}

class User: Hashable, Identifiable, ObservableObject {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    @Published var name: String
    @Published var avatar: String
    @Published var isMe: Bool = false
    
    init() {
        name = ""
        avatar = "a1"
        isMe = true
    }
    
    init(name: String, avatar: String, isMe: Bool) {
        self.name = name
        self.avatar = avatar
        self.isMe = isMe
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(avatar)
    }
    
}


