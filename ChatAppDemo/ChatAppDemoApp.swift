//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by Tuan Cai on 1/30/24.
//

import SwiftUI
import Firebase
@main
struct ChatAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
