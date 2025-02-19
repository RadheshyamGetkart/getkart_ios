//
//  GetkartApp.swift
//  Getkart
//
//  Created by gurmukh singh on 1/15/25.
//

import SwiftUI

@main
struct GetkartApp: App {
    @StateObject var authManager = AuthManager()

    var body: some Scene {

            WindowGroup {
                
                
                RootView()
                    .environmentObject(authManager) // Provide authentication state

                    .onAppear {

                        let appearance = UINavigationBarAppearance()
                               appearance.configureWithOpaqueBackground()
                            appearance.backgroundColor = UIColor.white // Set background color
                               appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                               appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

                               UINavigationBar.appearance().standardAppearance = appearance
                               UINavigationBar.appearance().scrollEdgeAppearance = appearance
                    }
        }
    }
}




class AuthManager: ObservableObject {
    @Published var isLoggedIn: Bool = false // Track login state
    
    func logout() {
        isLoggedIn = false // Logout user
    }
    
    func login() {
        isLoggedIn = true
    }
}


class NavigationCoordinator: ObservableObject {
    @Published var currentView: String? = nil

    func popToRoot() {
        currentView = nil
    }
}
