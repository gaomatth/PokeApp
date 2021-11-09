//
//  MockMessageInputView.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import SwiftUI

struct PokeInputView: View {
    @EnvironmentObject var dataMock: ChatDataSource
    @State var newMessage: String = ""
    @State var pokeHistogram = [Bool](repeating: false, count: 50)
    @State var pokeRecords:[CGFloat] = []
    var user: User
    
    var body: some View {
        VStack {
            PokeHistogramView(pokeHistogram: $pokeHistogram)
                .padding(.bottom)
                .padding(.top)
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            PokeButtonView(times: $pokeRecords, pokeHistogram: $pokeHistogram)
                .padding(.bottom)
            
            HStack {
                TextField("Additional message ...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 40)
                Spacer()
                Button(action: sendMessage) {
                            Text("Send")
                }
            }
            .padding()
        }
    }
    
    func sendMessage() {
        dataMock.messageHistory[user]?.append(Message(content: newMessage, pokeRecords: pokeRecords, user: dataMock.currentUser))
        pokeHistogram = [Bool](repeating: false, count: 50)
        pokeRecords = []
        newMessage = ""
    }
}
