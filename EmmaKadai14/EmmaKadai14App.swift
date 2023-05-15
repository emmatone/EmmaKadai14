//
//  EmmaKadai14App.swift
//  EmmaKadai14
//
//  Created by Emma
//

import SwiftUI

@main
struct EmmaKadai14App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Fruits())
        }
    }
}
