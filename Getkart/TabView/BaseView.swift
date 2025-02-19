//
//  BaseView.swift
//  Getkart
//
//  Created by Radheshyam Yadav on 17/02/25.
//

import SwiftUI

struct BaseView: View   {
    @State private var selectedTab = 0
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        
        ZStack {
            
            TabView(selection: $selectedTab) {
                NavigationView{
                    HomeView()
                }.navigationBarTitleDisplayMode(.inline)
                    .tabItem {
                        selectedTab == 0 ? Image("home_active") : Image("home")
                        Text("Home").font(Font.manrope(.regular, size: 18.0))
                    }
                    .tag(0)
                NavigationView{
                    
                    ChatView()
               
                }.navigationBarTitleDisplayMode(.inline)
               
                    .tabItem {
                        selectedTab == 1 ? Image("chat_active") : Image("chat")
                        Text("Chat").font(Font.manrope(.regular, size: 18.0))
                    }
                    .tag(1)
                
                Spacer()
                
                NavigationView{
                    
                    MyAdsView()
                        .navigationBarBackButtonHidden(true).navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("")
                        .toolbar {
                     
                            ToolbarItem(placement: .principal) {
                                
                                HStack {
                                    
                                    Text("My Advertisement").font(Font.manrope(.bold, size: 20))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                        }
                    
                }
             
                .tabItem {
                    selectedTab == 2 ? Image("myads_active") : Image("myads")
                    Text("My ads").font(Font.manrope(.regular, size: 18.0))
                }
                .tag(2)
                
                NavigationView{
                    
                    
                    
                    ProfileView().environmentObject(authManager).navigationBarBackButtonHidden(true).navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("")
                        .toolbar {
               
                            ToolbarItem(placement: .principal) {
                                HStack {
                                    Text("My Profile").font(Font.manrope(.bold, size: 20))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            
                        }
                }.navigationBarTitleDisplayMode(.inline)
              
                
                    .tabItem {
                        selectedTab == 3 ? Image("profile_active") : Image("profile")
                        Text("Profile").font(Font.manrope(.regular, size: 18.0))
                    }
                    .tag(3)
                
                
            }.accentColor(.orange)
            
            VStack {
                Spacer()
                HStack {
                    
                    // Home Tab Space
                    Spacer()
                    
                    // Center Plus Button
                    Button(action: {
                        // Action for Add Post button
                    }) {
                        Image("plus_button")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding()
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .offset(y: 0) // Lift the button slightly above the tab bar
                    
                    // My Ads Tab Space
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    BaseView()
}



