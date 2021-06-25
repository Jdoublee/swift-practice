//
//  tutorialApp.swift
//  tutorial
//
//  Created by hay on 2021/05/28.
//

import SwiftUI

@main
struct tutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
