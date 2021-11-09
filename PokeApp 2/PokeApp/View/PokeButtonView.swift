//
//  ContentView.swift
//  HapticButton
//
//  Created by Matthew Gao on 4/10/21.
//

import SwiftUI
let defaultTime: CGFloat = 5.0

struct PokeButtonView: View {
    
    @Binding var times:[CGFloat]
    @Binding var pokeHistogram: [Bool]
    
    @State private var isActive = false
    @State private var Owidth: CGFloat = 100
    @State private var Oheight: CGFloat = 100
    @State private var timeRemaining: CGFloat = defaultTime
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    let generator = UINotificationFeedbackGenerator()
    var body: some View {
        ZStack() {
            VStack() {
                Button(action:  {
                    Owidth = 80
                    Oheight = 80
                    isActive = true
                    if (timeRemaining > 0) {
                        let temp = ceil((5.0 - timeRemaining) * 100) / 100
                        times.append(temp)
                        pokeHistogram[Int(floor(temp * 10))] = true
                    }

                }) {
                    Text(timeRemaining != 5 ? String(format: "%.0f", Double(timeRemaining)) : "Poke")
                        .font(.title)
                        .font(Font.title.weight(.heavy))
                        .frame(width: Owidth, height: Oheight)
                        .padding()
                        .background(timeRemaining != 5 ? Color.red : Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(Color.white)
                        
                }.animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 0.5))
                .onReceive(timer, perform: {_ in
                    guard isActive else {return}
                    if timeRemaining > 0 {
                        timeRemaining -= 0.01
                    } else {
                        isActive = false
                        print(times)
                        self.timeRemaining = 5
                        times.removeAll()
                    }
                    self.Owidth = 100
                    self.Oheight = 100
                })
                .overlay(
                    Circle()
                        .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(5)
                )
            }.frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

