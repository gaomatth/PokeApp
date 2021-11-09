//
//  MockMessageContentView.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import SwiftUI

struct PokeMessageContentView: View {
    var contentMessage: String
    var isMyMessage: Bool
    
    var body: some View {
        VStack {
            Text(contentMessage)
                .font(.body)
                .padding(10)
                .background(isMyMessage ? Color.primary : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        
    }
}

struct MockMessageContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokeMessageContentView(contentMessage: "Hello World", isMyMessage: false)
    }
}
