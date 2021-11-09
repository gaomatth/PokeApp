//
//  MockMessageChatView.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import SwiftUI

struct PokeChatView: View {
    
    @EnvironmentObject var mockData: ChatDataSource
    var user: User
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { value in
                    
                    ForEach (mockData.messageHistory[user] ?? [], id: \.self) {
                        message in
                        PokeMessageView(message: message)
                    }
                }
                    
            }
            PokeInputView(user: user)
        }
        
    }
}

struct MockMessageChatView_Previews: PreviewProvider {
    
    static var mockChatHelper = ChatDataSource()
    
    static var previews: some View {
        PokeChatView(user: mockChatHelper.users[0])
            .environmentObject(mockChatHelper)
    }
}
