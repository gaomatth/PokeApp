//
//  PlayHapticButtonView.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/11/21.
//

import SwiftUI

struct PlayHapticButtonView: View {
    
    @State var isPlay:Bool = false
    
    var body: some View {
        Circle()
            .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 30, height: 30, alignment: .center)
            .overlay(
                Image(systemName: isPlay ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            )
            .onTapGesture {
                isPlay.toggle()
            }
    }
}

struct PlayHapticButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayHapticButtonView()
    }
}
