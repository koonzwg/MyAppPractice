//
//  MyScene.swift
//  MyAppPractice
//
//  Created by William Koonz on 3/12/24.
//

import SwiftUI

struct MyScene: Scene {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .badge("!")
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                
                SettingsView()
                    .badge("")
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

