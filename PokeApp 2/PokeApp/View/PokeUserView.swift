//
//  PokeUserView.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/11/21.
//

import SwiftUI

struct PokeUserView: View {
    @EnvironmentObject var mockData: ChatDataSource
    
    var body: some View {
        NavigationView {
            VStack {
                List (mockData.users){
                        user in
                    NavigationLink(destination: PokeChatView(user: user)) {
                        HStack {
                            Image(user.avatar)
                                .resizable()
                                .frame(minWidth: 10, idealWidth: 40, maxWidth: 50, minHeight: 10, idealHeight: 40, maxHeight: 50, alignment: .leading)
                                .cornerRadius(20)
                                .scaledToFit()
                            Text(user.name)
                            Spacer()
                        }
                    }
                }
            }
            .navigationBarTitle("Poke", displayMode: .automatic)
        }
        
    }
}

struct PokeUserView_Previews: PreviewProvider {
    static var previews: some View {
        PokeUserView().environmentObject(ChatDataSource())
    }
}
