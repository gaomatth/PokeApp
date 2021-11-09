//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Nguyễn Đức Quang on 4/10/21.
//

import SwiftUI

@main
struct PokeAppApp: App {
    let persistenceController = PersistenceController.shared
    let mockData = ChatDataSource()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(mockData)
        }
    }
}


