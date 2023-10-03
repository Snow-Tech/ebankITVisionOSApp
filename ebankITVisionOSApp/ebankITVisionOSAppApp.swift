//
//  ebankITVisionOSAppApp.swift
//  ebankITVisionOSApp
//
//  Created by ebankit on 02/10/2023.
//

import SwiftUI

@main
struct ebankITVisionOSAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack {
                    ContentView()
                }
                .tabItem { Label("Home", systemImage: "house") }
                
                Text("Profile")
                    .tabItem { Label("Profile", systemImage: "person.crop.circle.fill") }
            }
        }
        
        WindowGroup(id: "MultiWindowView") {
            NavigationStack {
                MultiWindowView()
            }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.4, height: 0.6, depth: 0, in: .meters)
    }
}
