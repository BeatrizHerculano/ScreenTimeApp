//
//  ZarioTestApp.swift
//  ZarioTest
//
//  Created by Beatriz Herculano on 23/10/23.
//

import SwiftUI
import SwiftData

@main
struct ZarioTestApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: SelectedApplication.self)
    }
}
