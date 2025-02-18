//
//  GetkartApp.swift
//  Getkart
//
//  Created by gurmukh singh on 1/15/25.
//

import SwiftUI

@main
struct GetkartApp: App {
    var body: some Scene {
            WindowGroup {
            LoginView()
                    .onAppear {
//                        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: "arrow.backward")
//                        UINavigationBar.appearance().backItem?.title = ""
//                        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
                        
                    }
        }
    }
}
