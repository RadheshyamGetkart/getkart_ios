//
//  RootView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 18/02/25.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        
        if authManager.isLoggedIn {
            BaseView() // Show home if logged in
        } else {
            LoginView() // Show login screen
        }
    }
}

#Preview {
    RootView()
}
